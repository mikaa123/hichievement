require "spec_helper"

describe ActionItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/action_items").should route_to("action_items#index")
    end

    it "routes to #new" do
      get("/action_items/new").should route_to("action_items#new")
    end

    it "routes to #show" do
      get("/action_items/1").should route_to("action_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/action_items/1/edit").should route_to("action_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/action_items").should route_to("action_items#create")
    end

    it "routes to #update" do
      put("/action_items/1").should route_to("action_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/action_items/1").should route_to("action_items#destroy", :id => "1")
    end

  end
end
