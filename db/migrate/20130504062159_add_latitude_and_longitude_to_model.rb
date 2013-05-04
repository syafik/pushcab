class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float

    add_column :taxi_requests, :latitude, :float
    add_column :taxi_requests, :longitude, :float
  end
end
