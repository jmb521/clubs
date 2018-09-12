class ApplicationController < ActionController::Base
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

  def is_admin

    if !current_user || !current_user.admin?
        redirect_to root_path
    end
  end

  protected
  def after_sign_in_path_for(resource)
      # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      # binding.pry
      if resource
        users_path
      else
        root_path
      end
  end

end
