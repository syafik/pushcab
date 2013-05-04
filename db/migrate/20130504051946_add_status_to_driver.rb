class AddStatusToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :status, :string, default: "available"
  end
end
