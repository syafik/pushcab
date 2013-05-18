class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_any!

  def authenticate_any!
    if cab_signed_in?
      true
    else
      authenticate_user!
    end
  end

  def user_login?
    user_signed_in? || cab_signed_in?
  end

  def current_login
    if user_signed_in? || cab_signed_in?
     user = current_user ?  current_user : current_cab
    end
  end

  def get_lat_lon
    my_ll = if Rails.env.eql?("development")
              [40.723323, -73.998413]
            else
              geoip = Geocoder.search(request.ip)
              lat = geoip.first.data["latitude"]
              lon = geoip.first.data["longitude"]
              [lat, lon]
            end
    p "My lat lon: ------#{my_ll}-------"
    my_ll = my_ll
  end
end
