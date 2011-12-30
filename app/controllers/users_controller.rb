class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?

  def show
    @user = User.find(params[:id])
	@action_items = ActionItem.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end
  
  def create_action_performed
    @user = User.find(params[:id])
    if @user.performed_actions.create!(params[:action_item])
	  redirect_to @user
    else
      render :edit
    end
  end
  
end
