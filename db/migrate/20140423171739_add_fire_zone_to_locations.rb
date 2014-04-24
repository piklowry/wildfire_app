class AddFireZoneToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :fire_zone, :string
  end
end
