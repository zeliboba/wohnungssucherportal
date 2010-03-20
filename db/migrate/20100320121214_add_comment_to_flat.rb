class AddCommentToFlat < ActiveRecord::Migration
  def self.up
    add_column :flats, :comment, :text
  end

  def self.down
    remove_column :flats, :comment
  end
end
