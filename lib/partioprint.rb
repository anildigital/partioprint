module ActionView
  module Partials
    
    def render_partial_with_print(options = {})
      partial_name = options[:partial]
      result = render_partial_without_print(options)
      result = "<!-- ERB:START #{partial_name} -->\n" + result + "\n<!-- ERB:END #{partial_name} -->" if RAILS_ENV == 'development'
    end
    
    alias_method :render_partial_without_print, :render_partial
    alias_method :render_partial, :render_partial_with_print
  end
  
end