class DropNotesFieldFromFlat < ActiveRecord::Migration
  def self.up
    remove_column :flats, :notes
  end

  def self.down
    add_column :flats, :notes, :text
  end
end
