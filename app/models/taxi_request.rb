class TaxiRequest < ActiveRecord::Base
  attr_accessible :cab_id, :pickup_location, :pickup_time, :status, :user_id, :latitude, :longitude

  belongs_to :user
  belongs_to :cab

  scope :pending, where(status: "pending")
end
