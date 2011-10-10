class AddSubtitleToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :subtitle, :string
  end
end
