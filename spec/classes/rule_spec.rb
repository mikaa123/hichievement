# require 'spec_helper'
# 
# class MockUser
#   def initialize
#   end
# end
# 
# describe Rule do
#   describe "Rule instanciation" do
#     it "can't be instanciated without a name and a lambda" do
#       expect { Rule.new }.to raise_error
#     end
#     
#     it "can be instanciated with a name and a lambda" do
#       Rule.new( "Foo" ){ print 'bar' }.should be_an_instance_of(Rule)
#     end
#   end
#   
#   describe "Rule verifies if a user conforms to its test" do
#     before(:each) do
#       @user = MockUser.new
#       @rule = Rule.new("Eating Achievement") do |user|
#         true
#       end
#     end
#     
#     it "should respond to user_conforms?" do
#       @rule.should respond_to(:user_conforms?)
#     end
#     
#     it "should return true when invoking user_conforms?" do
#       @rule.user_conforms?( @user ).should be_true
#     end
#   end
# end
