class PerformedActionsController < ApplicationController
  def index
    @performed_actions = PerformedAction.all
  end
  
  def show
   
  end

  def edit
    @performed_actions = PerformedAction.find(params[:id])
  end
  
  def new
    @performed_actions = PerformedAction.new()
  end
  
  def create
    p params
    @user=current_user
	if @user.performed_actions.create!(user: @user,action_item: params[:form][:action_item])
	  redirect_to @user
	else
	  redirect_to @user
	end
  end

  def update

  end
  
  def destroy 
    
  end
  
end
