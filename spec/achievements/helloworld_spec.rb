# This file tests the HelloWorld achievement defined under config/initializers/achievements_definition.rb
# Achievement test files must be placed in the spec/achievements/ folder.
#
# Each file describes one achievement
require 'spec_helper'
require_relative 'achievement_helper'

describe Achievement do
  
  describe "HelloWorld Achievement" do
  
    # before(:all) do
    #   @user = User.create!
    #   @user.performed_actions = [
    #       MockPerformedAction.new("Eat", "Healthy", Time.new(2012, 01, 01)),
    #     ]
    # end
  
    it "It should grant achievement if user has at least one performed action" do
      pending "Ca serait cool de le faire."
    end
  end

end