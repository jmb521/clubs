class Admin::ApplicationController < ApplicationController
  before_action :is_admin
  def dashboard
  end

  def index
    @users =  User.all

    respond_to do |format|
      format.html
      format.xlsx
    end
  end




end
