class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

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
