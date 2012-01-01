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
    user = current_user
    action_item = ActionItem.find(params[:action_item])
    
    if user.performed_actions.create!(user: user, action_item: action_item)
      # Let's ask the rule master which achievement the user has just
      # unlocked!!!11
      achievements_unlocked = RuleMaster.unlocked_achievements( user )

      # Let's check for each achievement if the user has it already. If she does
      # then we don't do anything, otherwise, we create a new one.
      achievements_unlocked.each do |achievement_name|
        unless user.unlocked_achievements.where(name: achievement_name).first
          # The user doesn't have the achievement yet!!11 let's add it!!!
          user.unlocked_achievements.create!(name: achievement_name)
        end
      end
      
      redirect_to dashboard_path, :notice => "#{action_item.description} added"
    else
      # Error
      redirect_to dashboard_path, :error => "Couldn't add action"
    end
  end

  def update

  end
  
  def destroy 
    
  end
  
end
