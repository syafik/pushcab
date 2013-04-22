class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :email
      t.string :phone_no
      t.string :available
      t.string :police_no

      t.timestamps
    end
  end
end
