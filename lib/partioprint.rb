class Partioprint
  # Does nothing here
end

# Reopening PartialRenderer class
class ActionView::PartialRenderer
  def render(context, options, block)
    setup(context, options, block)
    @template = find_partial

    @lookup_context.rendered_format ||= begin
                                          if @template && @template.formats.present?
                                            @template.formats.first
                                          else
                                            formats.first
                                          end
                                        end
    if @collection
      render_collection
    else
      render_partial
    end
  end

  private

  def render_partial
    instrument(:partial) do |payload|
      view, locals, block = @view, @locals, @block
      object, as = @object, @variable

      if !block && (layout = @options[:layout])
        layout = find_template(layout.to_s, @template_keys)
      end

      object = locals[as] if object.nil? # Respect object when object is false
      locals[as] = object if @has_object

      content = @template.render(view, locals) do |*name|
        view._layout_for(*name, &block)
      end

      partial_path = payload[:identifier].gsub(Rails.root.to_path, "")
      content = add_comment_to_content(content, partial_path)

      content = layout.render(view, locals) { content } if layout
      
      payload[:cache_hit] = view.cache_hit
      content
    end
  end

  def add_comment_to_content(content, partial_path)
    buffer("\n<!-- ERB:START partial '") +
      buffer(partial_path) +
      buffer("' -->\n") + content +
      buffer("\n<!-- ERB:END partial '") + buffer(partial_path) +
      buffer("' -->\n")
  end

  def buffer(str)
    ActionView::OutputBuffer.new(str)
  end
end
