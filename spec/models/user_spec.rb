require 'spec_helper'

describe User do
  it "can have performed actions" do
    user=Factory.create(:user)
	assert(user)
	user.performed_actions.should == []
	user.performed_actions.push(PerformedAction.new)
	user.performed_actions.should_not == []
  end
end
