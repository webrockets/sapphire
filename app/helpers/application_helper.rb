module ApplicationHelper
  def component(name, params = {}, &block)
    render_component(name, params, &block)
  end

  private

  def render_component(name, locals, &block)
    return render(layout: name, locals: locals, &block) if block_given?
    render partial: name, locals: locals
  end
end
