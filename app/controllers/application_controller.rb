class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :not_found

  private

  def layout_by_resource
    if devise_controller?
      'auth'
    else
      'application'
    end
  end

  def not_found
    redirect_to not_found_path
  end
end
