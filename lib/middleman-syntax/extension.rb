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

        require 'middleman-core/renderers/redcarpet'
        Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, MarkdownCodeRenderer
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

        options = ::Middleman::Syntax.options.merge :lexer => language
        concat_content Pygments.highlight(code, :options => options)
      end
    end

    module MarkdownCodeRenderer
      def block_code(code, language)
        options = ::Middleman::Syntax.options
        options.merge :lexer => language if language
        Pygments.highlight(code, :options => options)
      end
    end
  end
end
