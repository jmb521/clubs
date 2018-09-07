class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def show
    @membership = Membership.find(params[:id])
  end
end
