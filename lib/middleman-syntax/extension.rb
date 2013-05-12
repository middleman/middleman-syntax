module Middleman
  module Syntax
    class << self

      def options
        @@options
      end

      def registered(app, options_hash={})
        require 'pygments'

        @@options = options_hash
        yield @@options if block_given?

        app.send :include, Helper

        if app.markdown_engine == :redcarpet
          begin
            require 'middleman-core/renderers/redcarpet'
            Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, MarkdownCodeRenderer
          rescue LoadError
          end
        else
          begin
            require 'kramdown'
            Kramdown::Converter::Html.class_eval do
              def convert_codeblock(el, indent)
                attr = el.attr.dup
                language = extract_code_language!(attr)
                opts = ::Middleman::Syntax.options.dup
                opts.merge!(:lexer => language) if language
                Pygments.highlight(el.value, opts)
              end
            end
          rescue LoadError
          end
        end
      end
      alias :included :registered
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

        opts = ::Middleman::Syntax.options.dup
        opts.merge!(:lexer => language) if language
        concat_content Pygments.highlight(content, :options => opts)
      end
    end

    module MarkdownCodeRenderer
      def block_code(code, language)
        opts = ::Middleman::Syntax.options.dup
        opts.merge! :lexer => language if language
        Pygments.highlight(code, :options => opts)
      end
    end
  end
end
