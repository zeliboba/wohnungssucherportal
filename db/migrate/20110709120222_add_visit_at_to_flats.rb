class AddVisitAtToFlats < ActiveRecord::Migration
  def self.up
    add_column :flats, :visit_at, :timestamp
  end

  def self.down
    remove_column :flats, :visit_at
  end
end