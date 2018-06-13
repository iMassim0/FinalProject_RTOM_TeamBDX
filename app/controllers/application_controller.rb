class ApplicationController < ActionController::Base
  helper_method :set_user, :require_admin, :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include ApplicationHelper
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in,         keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up,         keys: [:username, :email, :country])
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

  def require_login
    unless user_signed_in?
      flash[:error] =  "Merci de vous connecter pour accéder à cette page."
      redirect_to new_user_registration_path
    end
  end


  def require_admin
  if set_user
    if @user.is_admin == false
      flash[:error] =  "Vous n'avez pas les droits Admin."
      redirect_to root_path
    end
  else
    require_login
  end
  end

  def set_user
    if current_user
      @user = current_user
    end
    return @user
  end

  private

  def after_sign_in_path_for(resource)
     "/profil"
  end

end
