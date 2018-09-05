class FamiliesController < ApplicationController

  def index
    @family = User.find_by(:id => params[:user_id].family)
  end
  def update

    @family = Family.find(params[:id])
    @family.update(family_params)
    redirect_to user_family_path(@family)
  end

  def edit
    @user = User.find_by(:id => params[:user_id])
    @family = Family.find(params[:id])
  end
  def show
    @family = Family.find(params[:id])
  end


  private

  def family_params
    params.require(:family).permit(:user_id, :user_birthday, :spouse, :spouse_birthday)
  end
end
