class Admin::CommitteesController < ApplicationController

  def index
    @committees = Committee.all
    @committee = Committee.new
  end

  def new
    @committee = Committee.new
  end

  def show
    @committee = Committee.find(params[:id])
  end

  def edit
    @committee = Committee.find(params[:id])
  end

  def update
    @committee = Committee.find(params[:id])
    @committee.update(committee_params)
    redirect_to admin_committees_path
  end

  def create
    @committee = Committee.create(committee_params)
    redirect_to admin_committees_path
  end

  private

  def committee_params
    params.require(:committee).permit(:name)
  end
end
