require 'spec_helper'

describe Achievement do
  describe "Achievement instanciation" do
    
    describe "Instanciation through the DSL" do
      before(:all) do
        @achievement = Achievement.define("TestAchievement") do
          set_desc "Foo"
          set_img_url "Bar"
          define_rule { |user| true }
        end
      end
      
      it "should raise an exception if the defined rule doesn't have a parameter" do
        expect { Achievement.define("TestAchievement2") do
          set_desc "Foo"
          set_img_url "Bar"
          define_rule { true }
        end }.to raise_error
      end

      it "should return an instance of Achievement" do
        @achievement.should be_an_instance_of(Achievement)
      end
      
      it "should be possible to access the achievement's properties" do
        @achievement.desc.should eq("Foo")
        @achievement.img_url.should eq("Bar")
        @achievement.rule.should be_an_instance_of(Proc)
      end
    end
  end
  
  describe "Verify if a user have the achievement" do
    it "should respond to user_conforms?" do
      Achievement.define("TestAchievement3") do
        set_desc "Foo"
        set_img_url "Bar"
        define_rule { |user| true }
      end.should respond_to(:user_conforms?)
    end
    
    it "should return true when invoking user_conforms?" do
      achievement = Achievement.define("TestAchievement4") do
        set_desc "Foo"
        set_img_url "Bar"
        define_rule { |user| true }
      end
      
      achievement.user_conforms?(nil).should be_true
    end
  end
end