class ApplicationController < ActionController::Base

  def home

  end

  def after_sign_in_path_for(resource)
 #  sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  def is_admin

    if !current_user || !current_user.admin?
        redirect_to root_path
    end
  end
end
