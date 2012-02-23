class CreateFlats < ActiveRecord::Migration
  def self.up
    create_table :flats do |t|
      t.string :title
      t.integer :rooms
      t.integer :square_meters
      t.string :street
      t.integer :price
      t.string :url
      t.date :available_on
      t.date :available_until
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :flats
  end
end
