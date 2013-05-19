module Middleman
  module Syntax
    class << self

      def options
        @@options
      end

      def registered(app, options_hash={})
        require 'rouge'

        @@options = options_hash
        yield @@options if block_given?

        app.send :include, Helper

        app.after_configuration do
          if markdown_engine == :redcarpet
            require 'middleman-core/renderers/redcarpet'
            Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, MarkdownCodeRenderer
          elsif markdown_engine == :kramdown
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
      end
      alias :included :registered
    end

    module Highlighter
      # A helper module for highlighting code
      def self.highlight(code, language)
        opts = ::Middleman::Syntax.options.dup
        lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::Text
        formatter = Rouge::Formatters::HTML.new(opts.reverse_merge({ :css_class => "highlight #{lexer.tag}" }))
        formatter.format(lexer.lex(code, opts))
      end
    end

    module Helper

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
      # @param [String] language the Pygments lexer to use
      def code(language=nil, &block)
        # Save current buffer for later
        @_out_buf, _buf_was = "", @_out_buf

        begin
          content = if block_given?
            capture_html(&block)
          else
            ""
          end
        ensure
          # Reset stored buffer
          @_out_buf = _buf_was
        end

        concat_content Middleman::Syntax::Highlighter.highlight(content, language)
      end
    end

    module MarkdownCodeRenderer
      def block_code(code, language)
        Middleman::Syntax::Highlighter.highlight(code, language)
      end
    end
  end
end
