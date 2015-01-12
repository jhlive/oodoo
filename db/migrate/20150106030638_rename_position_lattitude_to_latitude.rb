class RenamePositionLattitudeToLatitude < ActiveRecord::Migration
  def change
  	rename_column :positions, :lattitude, :latitude
  end
end
