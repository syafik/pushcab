class HomeController < ApplicationController
  skip_before_filter :authenticate_any!
  before_filter :current_login, :only => [:index]

  def index
    my_ll = get_lat_lon
    current_login.update_attributes(latitude: my_ll[0], :longitude => my_ll[1]) if user_login?
  end
end
