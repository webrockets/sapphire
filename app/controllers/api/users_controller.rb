module Api
  class UsersController < ApiController
    before_action :authenticate_user!
    before_action :set_user, only: %i[change_role]

    def change_role
      @user.update!(role: params[:role])
    end

    def me
      @user = current_user
    end

    private

    def set_user
      @user = authorize User.find params[:id]
    end
  end
end
