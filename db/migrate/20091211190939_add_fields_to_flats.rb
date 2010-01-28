class AddFieldsToFlats < ActiveRecord::Migration
  def self.up
    add_column :flats, :neighbourhood, :string
  end

  def self.down
    remove_column :flats, :neighbourhood
  end
end
