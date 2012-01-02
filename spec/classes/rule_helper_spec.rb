require 'spec_helper'

class MockPerformedAction
  attr_accessor :name, :group, :created_at
  def initialize(name, group, created_at)
    @name = name
    @group = group
    @created_at = created_at
  end
end

describe RuleHelper do
  
  it "should be accessible from within a rule block" do
    a = Achievement.define("RuleHelperAchievement") do
      set_desc "foo"
      set_img_url "bar"
      
      define_rule do |user|
        self.class.ancestors.include?(RuleHelper)
      end
    end
    
    a.user_conforms?(nil).should be_true
  end
  
  describe "repeated_every_day? method" do
    before(:all) { @rule_helper_obj = Object.new.extend(RuleHelper) }
      
    it "should raise an error if no performed_action is given" do
      expect { @rule_helper_obj.repeated_every_day?(nil, action: "Eat", days: 3) }.to raise_error
    end
    
    it "should return false if performed_action is empty" do
      @rule_helper_obj.repeated_every_day?([], action: "Eat", days: 3).should be_false
    end
    
    it "should raise error if no action or group is given" do
      expect {
        @rule_helper_obj.repeated_every_day?([], days: 3)
      }.to raise_error
    end
    
    it "should raise error if no day is given" do
      expect {
        @rule_helper_obj.repeated_every_day?([], action: "Eat")
      }.to raise_error
    end
    
    # it "should return true if the action specified is repeated every day for n days" do
    #   rule_helper_obj = Object.new.extend(RuleHelper)
    #   performed_action_list = nil
    #   
    #   rule_helper_obj.repeated_every_day?(performed_action_list, action: "Eat", days: 3).should be_true
    # end
  end
  
  describe "action_performed_on_date? method" do
    before(:all) do
      @rule_helper_obj = Object.new.extend(RuleHelper)
      @performed_actions = [
          MockPerformedAction.new("Eat", "Healthy", Time.new("2012-01-01 12:34:52 +0100")),
          MockPerformedAction.new("Eat", "Healthy", Time.new("2012-01-02 12:34:52 +0100")),
          MockPerformedAction.new("Eat", "Healthy", Time.new("2012-01-03 12:34:52 +0100")),
        ]
    end
    
    it "should respond to action_performed_on_date? method" do
      @rule_helper_obj.respond_to?(:action_performed_on_date?).should be_true
    end
    
    it "should raise error if performed_action if nil" do
      expect {
        @rule_helper_obj.action_performed_on_date?(nil, Date.today, action: "Eat")
      }.to raise_error
    end
    
    it "should raise error if date is nil" do
      expect {
        @rule_helper_obj.action_performed_on_date?([], nil, action: "Eat")
      }.to raise_error
    end
    
    it "should return false if performed_action is empty" do
      @rule_helper_obj.action_performed_on_date?([], Date.today, action: "Eat")
    end
    
    it "should return true if an action has been performed on that date" do
      date = Time.new("2012-01-02 12:34:52 +0100").to_date
      @rule_helper_obj.action_performed_on_date?(@performed_actions, date, action: "Eat").should be_true
    end
    
    it "should return false if an action has not been performed on that date" do
      date = Time.new.to_date
      @rule_helper_obj.action_performed_on_date?(@performed_actions, date, action: "Eat").should be_false
    end
    
    it "should return true if an action of a group has been performed on that date" do
      date = Time.new("2012-01-02 12:34:52 +0100").to_date
      @rule_helper_obj.action_performed_on_date?(@performed_actions, date, group: "Healthy").should be_true
    end
    
    it "should return true if an action of a group hasn't been performed on that date" do
      date = Time.new.to_date
      @rule_helper_obj.action_performed_on_date?(@performed_actions, date, group: "Healthy").should be_false
    end
    
  end
end