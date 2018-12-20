class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def show
    @membership = Membership.find_by(:user_id => params[:id])
    
  end
end
