class DashboardController < ApplicationController
  before_filter :require_login
  layout "dashboard_layout"
  
  include ActionView::Helpers::DateHelper
  
  def index
	  @action_groups = ActionGroup.all
  end
  
  def calendar
    user = current_user
    # Calendar is going to be an array containing an array of
    # actions performed that day
    # It'll look something like that:
    #
    # calendar = [
    #             [<#PerformedAction>, <#PerformedAction>]],
    #             [<#PerformedAction>]],
    #            ]
    @calendar = [[], [], [], [], [], [], []]
    
    # Get the actions from the last 7 days
    user.performed_actions.where(:created_at.gte => 7.days.ago).each_with_index do |action|
      if 0.days.ago.to_date == action.created_at.to_date
        @calendar[0] << action
        
      elsif 1.days.ago.to_date == action.created_at.to_date
        @calendar[1] << action
        
      elsif 2.days.ago.to_date == action.created_at.to_date
        @calendar[2] << action
      
      elsif 3.days.ago.to_date == action.created_at.to_date
        @calendar[3] << action
      
      elsif 4.days.ago.to_date == action.created_at.to_date
        @calendar[4] << action
        
      elsif 5.days.ago.to_date == action.created_at.to_date
        @calendar[5] << action
      
      elsif 6.days.ago.to_date == action.created_at.to_date
        @calendar[6] << action
      end
    end
    
    # Then we return the calendar
    @calendar
  end
end
