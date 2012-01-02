require 'spec_helper'

describe ActionGroup do
  it "should have a unique name" do
    ActionGroup.create!(name: "Daily")
    expect { ActionGroup.create!(name: "Daily") }.to raise_error
  end
  
  it "should have action_items" do
    group = Factory.create(:action_group)
    group.action_items.should_not be_nil
  end
  
  it "should be possible to add new action_items to the group" do
    group = Factory.create(:action_group)
    group.action_items << Factory.create(:action_item)
    group.reload
    group.action_items.count.should == 1
  end
end
