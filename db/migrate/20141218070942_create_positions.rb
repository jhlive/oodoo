class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :message
      t.float :lattitude
      t.float :longitude
      t.references :tracking_route
      t.timestamps
    end
  end
end
