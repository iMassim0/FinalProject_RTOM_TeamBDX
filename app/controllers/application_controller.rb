class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include ApplicationHelper
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in,         keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up,         keys: [:username, :email])
    devise_parameter_sanitizer.permit(:account_update,  keys: [
                    :username,
                    :lastname,
                    :firstname,
                    :email,
                    :country,
                    :avatar,
                    :birthday,
                    :del_address,
                    :del_zipcode,
                    :del_town,
                    :phonenumber
                    ])
  end

  private

  def after_sign_in_path_for(resource)
     "/profile"
  end

end
