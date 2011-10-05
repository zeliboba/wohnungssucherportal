class MoveStaticFavoritePlacesToDb < ActiveRecord::Migration
  def up
    [
      {:name => 'Arbeit Kasia', :city => 'München', :street => 'Marcel-Breuer-Straße 12'},
      {:name => 'Xenia und Jan', :city => 'München', :street => 'Gabelsbergerstrasse 48'},
      {:name => 'Circulo Salsa', :city => 'München', :street => 'Rosenheimer Straße 139'}
    ].each do |args|
      FavoritePlace.create!(args)
    end
  end

  def down
    FavoritePlace.delete_all
  end
end
