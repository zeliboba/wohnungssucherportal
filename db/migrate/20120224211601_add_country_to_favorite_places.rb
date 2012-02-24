class AddCountryToFavoritePlaces < ActiveRecord::Migration
  def change
    add_column :favorite_places, :country, :string
  end
end
