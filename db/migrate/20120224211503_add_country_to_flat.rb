class AddCountryToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :country, :string
  end
end
