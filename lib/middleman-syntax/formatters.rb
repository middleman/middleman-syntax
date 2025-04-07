module Middleman
  module Syntax
    module Formatters
      class HTML < Rouge::Formatter
        tag 'html'

        def initialize(opts={})
          @formatter = if opts[:inline_theme]
                         Rouge::Formatters::HTMLInline.new(opts[:inline_theme])
                       else
                         Rouge::Formatters::HTML.new
                       end

          @formatter = Rouge::Formatters::HTMLTable.new(@formatter, opts) if opts[:line_numbers]
        
          @formatter = Rouge::Formatters::HTMLLinewise.new(@formatter, class:'line-%i') if opts[:line_numbers_div]

          if opts.fetch(:wrap, true)
            css_class = opts.fetch(:css_class, 'codehilite')
            
            # Add custom classes to the pre element
            if opts[:extra_css_classes] && !opts[:extra_css_classes].empty?
              extra_css_classes = opts[:extra_css_classes].is_a?(Array) ? opts[:extra_css_classes] : opts[:extra_css_classes].to_s.split
              # Include the custom classes in the css_class parameter
              css_class = [css_class].concat(extra_css_classes).join(' ')
            end
            
            @formatter = Rouge::Formatters::HTMLPygments.new(@formatter, css_class)
          end
        end

        def stream(tokens, &block)
          @formatter.stream(tokens, &block)
        end
      end
    end
  end
end
