require 'spec_helper'

describe RuleMaster do
  describe "Finding achievement a user has unlocked" do
    
    it "should respond to unlocked_achievements method" do
      RuleMaster.should respond_to :unlocked_achievements
    end
    
    it "should return nil when the user sent is nil" do
      RuleMaster.unlocked_achievements(nil).should be_nil
    end
    
    it "should return an array of achievement when the user unlocked some" do
      user = Factory.create(:user)
      
      # Describe an achievement here
      achievement = Achievement.define "RuleMaster Achievement" do
        set_desc "Foo"
        set_img_url "Bar"
        
        define_rule do |user|
          true
        end
      end
      
      RuleMaster.unlocked_achievements(user).should include(achievement)
    end

  end
end