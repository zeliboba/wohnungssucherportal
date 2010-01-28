class AddImageLinksToFlat < ActiveRecord::Migration
  def self.up
    add_column :flats, :image_links, :text
  end

  def self.down
    remove_column :flats, :image_links
  end
end
