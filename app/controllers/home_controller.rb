class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  before_filter :get_lat_lon, :only => [:index]
  
  def index

  end
end
