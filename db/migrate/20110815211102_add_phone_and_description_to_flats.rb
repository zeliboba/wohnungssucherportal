class AddPhoneAndDescriptionToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :contact_phone, :string
    add_column :flats, :description, :text
  end
end