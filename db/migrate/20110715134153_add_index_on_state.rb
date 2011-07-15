class AddIndexOnState < ActiveRecord::Migration
  def self.up
    add_index :flats, :state
  end

  def self.down
    remove_index :flats, :state
  end
end