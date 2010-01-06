module ActionView
  module Partials

    def render_partial_with_print(options = {})
      partial_name = options[:partial]
      result = render_partial_without_print(options)

      if result && result !~ /^\s*<(!DOCTYPE|html)/
        result = "<!-- ERB:START partial: #{partial_name} -->\n" + result + "\n<!-- ERB:END partial: #{partial_name} -->"
      end

      result
    end

    alias_method :render_partial_without_print, :render_partial
    alias_method :render_partial, :render_partial_with_print
  end
  
end
