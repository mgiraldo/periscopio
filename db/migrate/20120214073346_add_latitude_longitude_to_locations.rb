class AddLatitudeLongitudeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :lat, :decimal, :precision => 15, :scale => 10
    add_column :locations, :lon, :decimal, :precision => 15, :scale => 10
  end
end
