class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_if_user_belongs_to_business
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def check_if_user_belongs_to_business
    if params[:controller] != "pages" && current_user.businesses.empty?
      redirect_to root_path, notice: "You need to have at least one business to access this page."
    end
  end
end
