class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_if_user_have_business
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def check_if_user_have_business
    if current_user && current_user.businesses.empty?
      redirect_to new_business_path, notice: "You need to have a company before continue" unless params[:controller] == 'pages' || params[:controller] == 'businesses'
    end
  end
end
