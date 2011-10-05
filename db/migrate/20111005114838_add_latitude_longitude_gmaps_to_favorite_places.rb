class AddLatitudeLongitudeGmapsToFavoritePlaces < ActiveRecord::Migration
  def change
    add_column :favorite_places, :latitude, :float
    add_column :favorite_places, :longitude, :float
    add_column :favorite_places, :gmaps, :boolean
  end
end
