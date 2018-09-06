class Admin::MembershipController < ApplicationController
  before_action :user_signed_in?
  before_action :is_admin
  def index
    @user = User.all
  end

  def pending
    @users = User.where(:role => "applicant")
  end

  def make_user
    @user = User.find(params[:id])
    @user.update(:role => "member")
    redirect_back(fallback_location: admin_dashboard_path)
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update(:role => "admin")

    redirect_back(fallback_location: admin_dashboard_path)
  end
end