
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery
  def home

  end

  # def after_sign_in_path_for(resource)
  #   if current_user.profile.first_name != nil
  #     users_path
  #   else
  #     profile_path(current_user.profile.id)
  #   end
  # end

  def resale

  end

  def membership

  end

  def is_admin

    if !current_user || !current_user.admin?
        redirect_to root_path
    end
  end

  protected
  def after_sign_in_path_for(resource)

      if resource
        users_path
      else
        root_path
      end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :phone, :birthday, :spouse, :spouse_birthday, :user_id]])
  end
  
  


end
