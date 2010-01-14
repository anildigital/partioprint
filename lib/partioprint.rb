module ActionView
  module Partials

    def render_partial_with_print(options = {})
      partial_name = options[:partial]
      result = render_partial_without_print(options)

      if result && result !~ /^\s*<(!DOCTYPE|html)/
        prepend_result = "<!-- ERB:START partial: #{partial_name} -->\n"
        append_result = "\n<!-- ERB:END partial: #{partial_name} -->"

        local_vars = print_locals(options[:locals])
        result = prepend_result + local_vars + result + append_result
      end

      result
    end

    alias_method :render_partial_without_print, :render_partial
    alias_method :render_partial, :render_partial_with_print

    def print_locals(locals)
      comment="<!-- START Local variables:-->\n"
      locals.each_pair {|key, value| comment+="\n<!-- #{key} : #{value.to_json} -->"}
      comment+="<!-- END Local variables:-->\n"
      comment
    end
  end
  
end
