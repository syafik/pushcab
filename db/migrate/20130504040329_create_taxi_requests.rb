class CreateTaxiRequests < ActiveRecord::Migration
  def change
    create_table :taxi_requests do |t|
      t.integer :user_id
      t.integer :driver_id
      t.string :status
      t.string :pickup_location
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
