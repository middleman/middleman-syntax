module Middleman
  module Syntax
    # A mixin for the Redcarpet Markdown renderer that will highlight
    # code.
    module RedcarpetCodeRenderer
      def block_code(code, language)
        Middleman::Syntax::Highlighter.highlight(code, language)
      end
    end
  end
end
