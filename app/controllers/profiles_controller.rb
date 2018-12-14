class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @profile = Profile.find(params[:id])

  end

  def edit

    @profile = Profile.find(params[:id])

  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    redirect_to new_user_family_path(current_user.id)
  end

  def update

    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    @profile.save
    redirect_to profile_path(@profile)
    # @family = Family.find_by(:user_id => @profile.user_id)
    # if !@family
    #   redirect_to edit_user_family_path(@profile.user_id)
    # else
    #   redirect_to user_profile_path(@profile)
    # end
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :phone, :user_id)
  end
end
