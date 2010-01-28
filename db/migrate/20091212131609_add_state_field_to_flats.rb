class AddStateFieldToFlats < ActiveRecord::Migration
  def self.up
    add_column :flats, :state, :string
  end

  def self.down
    remove_column :flats, :state
  end
end
