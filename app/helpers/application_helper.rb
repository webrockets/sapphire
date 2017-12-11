module ApplicationHelper
  def component(name, params = {}, &block)
    render_component("components/#{name}", params, &block)
  end

  def can?(action, record)
    policy(record).public_send((action.to_s + '?').to_sym)
  end

  private

  def render_component(name, locals, &block)
    return render(layout: name, locals: locals, &block) if block_given?
    render partial: name, locals: locals
  end
end
