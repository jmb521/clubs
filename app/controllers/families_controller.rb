class FamiliesController < ApplicationController
  before_action :authenticate_user!
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

  def new
    @user = User.find_by(:id => params[:user_id])
    @family = Family.new
  end

  def create
    @user = User.find(params[:user_id])
    @family = Family.new(family_params)
    @family.user_id = @user.id
    @family.save
    UserSignUpMailer.notification_user_signup(@user).deliver_now()
    redirect_to new_user_child_path(@user)
  end

  private

  def family_params
    params.require(:family).permit(:user_id, :user_birthday, :spouse, :spouse_birthday)
  end
end
