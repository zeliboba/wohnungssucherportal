class AddPriorityToFlats < ActiveRecord::Migration
  def self.up
    add_column :flats, :priority, :integer
  end

  def self.down
    remove_column :flats, :priority
  end
end
