class CreateFavoritePlaces < ActiveRecord::Migration
  def change
    create_table :favorite_places do |t|
      t.string :name
      t.string :street
      t.string :city

      t.timestamps
    end
  end
end
