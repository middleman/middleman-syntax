require 'rouge'

module Middleman
  module Syntax
    class SyntaxExtension < Extension
      option :css_class, 'highlight', 'Class name applied to the syntax-highlighted output.'
      option :line_numbers, false, 'Generate line numbers.'
      option :inline_theme, nil, 'A Rouge::CSSTheme that will be used to highlight the output with inline styles instead of using CSS classes.'
      option :wrap, true, 'Wrap the highlighted content in a container (<pre> or <div>, depending on whether :line_numbers is on).'
      option :lexer_options, {}, 'Options for the Rouge lexers.'

      def after_configuration
        Middleman::Syntax::Highlighter.options = options

        if app.config[:markdown_engine] == :redcarpet
          require 'middleman-core/renderers/redcarpet'
          Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, RedcarpetCodeRenderer
        elsif app.config[:markdown_engine] == :kramdown
          require 'kramdown'
          Kramdown::Converter::Html.class_eval do
            def convert_codeblock(el, indent)
              attr = el.attr.dup
              language = extract_code_language!(attr)
              Middleman::Syntax::Highlighter.highlight(el.value, language)
            end
          end
        end
      end

      helpers do
        # Output highlighted code. Use like:
        #
        #    <% code('ruby') do %>
        #      my code
        #    <% end %>
        #
        # To produce the following structure:
        #
        #    <div class="highlight">
        #      <pre>#{your code}
        #      </pre>
        #    </div>
        #
        # @param [String] language the Rouge lexer to use
        # @param [Hash] Options to pass to the Rouge formatter & lexer, overriding global options set by :highlighter_options.
        def code(language=nil, options={}, &block)
          raise 'The code helper requires a block to be provided.' unless block_given?

          # Save current buffer for later
          @_out_buf, _buf_was = "", @_out_buf

          begin
            content = capture_html(&block)
          ensure
            # Reset stored buffer
            @_out_buf = _buf_was
          end
          content = content.encode(Encoding::UTF_8)

          concat_content Middleman::Syntax::Highlighter.highlight(content, language).html_safe
        end
      end
    end

    # A mixin for the Redcarpet Markdown renderer that will highlight
    # code.
    module RedcarpetCodeRenderer
      def block_code(code, language)
        Middleman::Syntax::Highlighter.highlight(code, language)
      end
    end

    module Highlighter
      mattr_accessor :options

      # A helper module for highlighting code
      def self.highlight(code, language=nil, opts={})
        lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText

        highlighter_options = options.to_h.merge(opts)
        highlighter_options[:css_class] = [ highlighter_options[:css_class], lexer.tag ].join(' ')
        lexer_options = highlighter_options.delete(:lexer_options)

        formatter = Rouge::Formatters::HTML.new(highlighter_options)
        formatter.format(lexer.lex(code, options.lexer_options))
      end
    end
  end
end

# If Haml is around, define a :code filter that can be used to more conveniently output highlighted code.
if defined? Haml
  module Haml
    module Filters
      module Code
        include Base

        def render(code)
          code = code.encode(Encoding::UTF_8)

          # Allow language to be specified via a special comment like:
          #  # lang: ruby
          if code.lines.first =~ /\A\s*#\s*lang:\s*(\w+)$/
            language = $1
            code = code.lines.to_a[1..-1].join # Strip first line
          end

          Middleman::Syntax::Highlighter.highlight(code, language)
        end
      end
    end
  end
end
