module Middleman
  module Syntax
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
