class HomeController < ApplicationController
  def index
    return redirect_to admin_dashboard_path if user_signed_in?
  end
end
