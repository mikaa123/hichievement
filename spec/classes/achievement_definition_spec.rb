require 'spec_helper'

# Test Achievement's DSL to create achievements
describe Achievement do
  it "should have a List array constant" do
    Achievement::List.should be_an_instance_of(Array)
  end
  
  it "should add a new achievement to the List array when
    defining a new achievement and return the achievement" do
    
    achievement = nil
    expect {
      achievement = Achievement.define("FooAchievement") do
        set_desc "some desc"
        set_img_url "some url"
        
        define_rule do |user|
          true
        end
      end
    }.to change{ Achievement::List.count}.by(1)
    
    achievement.should be_an_instance_of(Achievement)
  end
end