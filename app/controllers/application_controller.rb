class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?

private
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

  # def create
  #   @user = user.create(user_params)
  # end

  # private
  # def user_params
  #   params.require(:user).permit(:name)
  # end



end
