class CommitteesController < ApplicationController
  before_action :authenticate_user!
  def new
    @committee = UserCommittees.new
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
    @committees = @user.committees
    @committee = UserCommittee.new
  end

  def destroy
    @committee = UserCommittee.delete
    # render
  end

  def user_committee_params
    params.require(:user_committees).permit(:user_id, :committee_id)
  end
end
