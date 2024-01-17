# If Haml is around, define a :code filter that can be used to more conveniently output highlighted code.
if defined? Haml
  module HamlMonkeyPatch
    def render(code)
      code = code.rstrip
      code = code.encode(Encoding::UTF_8)

      # Allow language to be specified via a special comment like:
      # # lang: ruby
      if code.lines.first =~ /\A\s*#\s*lang:\s*(\w+)$/
        language = $1
        code = code.lines.to_a[1..-1].join # Strip first line
      end

      Middleman::Syntax::Highlighter.highlight(code, language)
    end
  end

  if Gem::Version.new(Haml::VERSION) >= Gem::Version.new("6.0.0.beta.1")
    module Haml
      class Filters
        class Code < Base
          include HamlMonkeyPatch
        end
      end
    end
  else
    module Haml
      module Filters
        module Code
          include Base, HamlMonkeyPatch
        end
      end
    end
  end
end
