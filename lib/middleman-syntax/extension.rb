module Middleman
  module Syntax
    class << self
      def registered(app, options_hash={})
        require 'pygments'

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
      def code(language, &block)
        # Note: Language is required because pygments.rb currently
        # segfaults on Mac OS X when no lexer is specified:
        # https://github.com/tmm1/pygments.rb/issues/18

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

        concat_content Pygments.highlight(content, :lexer => language)
      end
    end

    module MarkdownCodeRenderer
      def block_code(code, language)
        Pygments.highlight(code, :lexer => language)
      end
    end
  end
end
