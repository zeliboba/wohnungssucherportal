class AddLatitudeLongitudeGmapsToFlats < ActiveRecord::Migration
  def self.up
    add_column :flats, :latitude, :float
    add_column :flats, :longitude, :float
    add_column :flats, :gmaps, :boolean
  end

  def self.down
    remove_column :flats, :gmaps
    remove_column :flats, :longitude
    remove_column :flats, :latitude
  end
end