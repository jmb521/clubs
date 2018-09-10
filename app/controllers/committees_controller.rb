class CommitteesController < ApplicationController
  before_action :authenticate_user!
  def new
    @committee = UserCommittee.new
    @committee_list = Committee.all
  end

  def create
    @committee = UserCommittee.create(:user_id => params[:user_id], :committee_id => params[:user_committee][:committee])
    redirect_back(fallback_location: profile_path(current_user.profile))
  end

  def update
    @committee = UserCommittee.find_by(:user_id => params[:id])
    @committee.update(user_committee_params)
    redirect_back(fallback_location: profile_path(current_user.profile))
  end

  def show

    @user = User.find(params[:id])
    @user_committees = @user.committees
    @committee = UserCommittee.new
    @committees = Committee.all
  end

  def destroy

    @user = User.find_by(:id => params[:user_id])
    @committee = @user.user_committees.find_by(:committee_id => params[:id])
    @committee.delete
    # @committee = UserCommittee.delete
    redirect_back(fallback_location: user_committee_path(:id => current_user.id))
  end

  def add_user_to_committee

    UserCommittee.create(:user_id =>params[:user_id], :committee_id => params[:committee_id])
    redirect_back(fallback_location: user_committee_path(:id => params[:user_id]))
  end

  def user_committee_params
    params.require(:user_committees).permit(:user_id, :committee_id)
  end
end
