module ActionView
  module Partials
    
    def render_partial_with_print(options = {})
      partial_name = options[:partial]
      result = render_partial_without_print(options)
      result = "<!-- partial #{partial_name} starts -->\n" + result + "\n<!-- partial #{partial_name} ends -->" 
    end
    
    alias_method :render_partial_without_print, :render_partial
    alias_method :render_partial, :render_partial_with_print
  end
  
end