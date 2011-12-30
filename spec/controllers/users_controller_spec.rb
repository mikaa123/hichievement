require 'spec_helper'

describe UsersController do

  describe "GET a user profile" do
    it "returns http success" do

      # Creates a new user using the factory defined in
      # spec/factories.rb
      new_user = Factory.create(:user)

      # Sends a request to the User controller's "show" action
      get :show, :id => new_user.id

      response.should be_success
    end
  end

end
