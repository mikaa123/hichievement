require 'spec_helper'

describe "ActionItems" do
  describe "GET /action_items" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get action_items_path
      response.status.should be(200)
    end
  end
end
