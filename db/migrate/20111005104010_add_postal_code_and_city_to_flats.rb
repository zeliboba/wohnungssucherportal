class AddPostalCodeAndCityToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :postal_code, :string
    add_column :flats, :city, :string
  end
end