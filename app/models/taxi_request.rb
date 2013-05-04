class TaxiRequest < ActiveRecord::Base
  attr_accessible :driver_id, :pickup_location, :pickup_time, :status, :user_id, :latitude, :longitude

  belongs_to :user
  belongs_to :driver

end
