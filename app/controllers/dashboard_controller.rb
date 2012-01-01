class DashboardController < ApplicationController
  before_filter :require_login
  
  def index
	  @action_items = ActionItem.all
  end
end
