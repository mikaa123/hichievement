# require 'spec_helper'
# 
# # Test Rule's DSL to create rules
# describe Rule do
#   it "should have a Rules array" do
#     Rule::Rules.should be_an_instance_of(Array)
#   end
#   
#   it "should add a new rule instance to the Rules array when describing a new rule" do
#     expect{
#       Rule.describe "Foo" do |user|
#         print "bar"
#       end
#     }.to change{ Rule::Rules.count }.by(1)
#   end
# end