require 'spec_helper'

describe User do
  it "can have performed actions" do
    user = Factory.create(:user)
	  assert(user)
	  user.performed_actions.should == []
	  user.performed_actions.push(PerformedAction.new)
	  user.performed_actions.should_not == []
  end
  
  describe "checkout_cart method" do
    it "should raise an error when user has no cart" do
      user = User.create!
      expect { user.checkout_cart }.to raise_error
    end
    
    it "should raise an error when user's cart is empty" do
      user = Factory.create(:user).action_cart.action_cart_items.delete_all
      expect { user.checkout_cart }.to raise_error
    end
    
    it "should add achievements when necessary" do
      
      user = Factory.create(:user)
      user.checkout_cart.should_not be_empty
    end
  end
end
