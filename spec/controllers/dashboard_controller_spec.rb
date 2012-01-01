require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    it "returns http success if logged" do
      session[:user_id] = Factory.create(:user).id
      get 'index'
      response.should be_success
    end
  end

end
