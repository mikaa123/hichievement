class HomeController < ApplicationController
  def index
    # We don't want to use the default layout for our
	  # homepage.
    render :layout => false
  end

end
