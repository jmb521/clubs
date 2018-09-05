class ChildrenController < ApplicationController

  def index
    @children = User.find_by(:id => params[:user_id]).children
    # @children = Child.where(:user_id => params[:user_id])
  end

  # def show
  #   @children = User.find_by(:id => params[:user_id])
  # end

  def edit
    @user = User.find_by(:id => params[:user_id])
    @child = @user.children.find_by(:id => params[:id])
    # if !@child
    #   redirect_to new_user_child_path
    # end
  end

  def update
    
    @children = Child.find(params[:id])
    @children.update(children_params)
    @children.save

    redirect_to user_children_path(@children.user_id)
  end

  def new
    @child = Child.new
    @user = User.find_by(:id => params[:user_id])
  end
  def create
    @child = current_user.children.create(children_params)
    binding.pry
    redirect_to user_children_path(@child.user_id)

  end

  def destroy
    @child = Child.find_by(:id => params[:id])
    @child.destroy
    redirect_to user_children_path(:user_id => @child.user_id)
  end


  private
  def children_params
    params.require(:child).permit(:user_id, :name, :birthday)
  end
end
