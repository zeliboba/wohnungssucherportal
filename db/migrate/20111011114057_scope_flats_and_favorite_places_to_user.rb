class ScopeFlatsAndFavoritePlacesToUser < ActiveRecord::Migration
  def up
    add_column :flats, :user_id, :integer
    add_column :favorite_places, :user_id, :integer
  end

  def down
    remove_column :flats, :user_id
    remove_column :favorite_places, :user_id
  end
end