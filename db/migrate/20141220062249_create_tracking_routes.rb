class CreateTrackingRoutes < ActiveRecord::Migration
  def change
    create_table :tracking_routes do |t|
      t.references :device, index: true
      t.datetime :started_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
