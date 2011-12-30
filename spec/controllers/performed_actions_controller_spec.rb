require 'spec_helper'

describe PerformedActionsController do
  def valid_attributes
    {}
  end
  
  describe "POST create" do
    it "creates a performed action" do
      user = Factory.create(:user)
	  session[:user_id]=user.id
	  action_item = Factory.create(:action_item)
      post :create, :form => {:action_item => action_item}
	  user=User.find(session[:user_id])
	  user.performed_actions.should_not == []
    end
  end
end
