module ActionView

  module Partials

    @@partioprint_decorators = [LocalsPrinter, PartioPrinter] 
    #@@partioprint_decorators = [PartioPrinter]  Use this for without Local Variable support

    def render_partial_with_print(options = {})
      result = render_partial_without_print(options)
      core_printer = CorePrinter.new(result, options)

      printer = core_printer
      for each_decorator in @@partioprint_decorators
        printer = each_decorator.new(printer)
      end

      printer.to_s
    end

    alias_method :render_partial_without_print, :render_partial
    alias_method :render_partial, :render_partial_with_print


    # Allows setting decorators externally
    def self.partioprint_decorators=(decorators)
      @@partioprint_decorators = decorators
    end

  end

end
