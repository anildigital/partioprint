# Prints partial name as html comments when partial is rendered.

class PartioPrinter

  def initialize(printer)   
    @printer = printer
  end

  def options
    @printer.options
  end

  def to_s
    partial_name = options[:partial] 
    partio_string = @printer.to_s
    if partio_string && partio_string !~ /^\s*<(!DOCTYPE|html)/
      prepend_result = "<!-- ERB:START partial: #{partial_name} -->\n"
      append_result = "\n<!-- ERB:END partial: #{partial_name} -->"
      partio_string = prepend_result + partio_string + append_result
    end
    partio_string
  end

end