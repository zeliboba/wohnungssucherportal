# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111011114341) do

  create_table "favorite_places", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "user_id"
  end

  create_table "flats", :force => true do |t|
    t.string   "title"
    t.integer  "rooms"
    t.integer  "square_meters"
    t.string   "street"
    t.integer  "price"
    t.string   "url"
    t.date     "available_on"
    t.date     "available_until"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "neighbourhood"
    t.string   "contact_person"
    t.text     "image_links"
    t.integer  "priority"
    t.string   "state"
    t.text     "comment"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "visit_at"
    t.string   "contact_phone"
    t.text     "description"
    t.string   "postal_code"
    t.string   "city"
    t.string   "subtitle"
    t.integer  "user_id"
  end

  add_index "flats", ["state"], :name => "index_flats_on_state"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
