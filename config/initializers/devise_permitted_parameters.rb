module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :location, :avatar) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :location, :email, :password, :password_confirmation, :current_password, :avatar) }
  end

end

DeviseController.send :include, DevisePermittedParameters
