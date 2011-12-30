class DashboardController < ApplicationController
  def index
	  @action_items = ActionItem.all
  end
end
