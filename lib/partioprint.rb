module ActionView
  module Partials

    class PartialRenderer

      def render_partial_with_print(object = @object)

        result = render_partial_without_print(@object)
        
        partial_name = @template.virtual_path

        if result !~ /^\s*<(!DOCTYPE|html)/
          result = ActionView::OutputBuffer.new("<!-- ERB:START partial: #{partial_name} -->\n") +
            result +
            ActionView::OutputBuffer.new("\n<!-- ERB:END partial: #{partial_name} -->")
        end

        return result
      end

      alias_method :render_partial_without_print, :render_partial
      alias_method :render_partial, :render_partial_with_print

    end
  end
  
end
