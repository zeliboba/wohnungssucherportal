class AddContactPersonToFlat < ActiveRecord::Migration
  def self.up
    add_column :flats, :contact_person, :string
  end

  def self.down
    remove_column :flats, :contact_person
  end
end
