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

ActiveRecord::Schema.define(:version => 20120412220801) do

  create_table "albums", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "path"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.text     "note"
  end

  add_index "albums", ["id"], :name => "index_albums_on_id", :unique => true

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_albums", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_albums", ["album_id"], :name => "index_collection_albums_on_album_id"
  add_index "collection_albums", ["collection_id"], :name => "index_collection_albums_on_collection_id"

  create_table "collections", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["id"], :name => "index_collections_on_id", :unique => true

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "read",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "permissions", :force => true do |t|
    t.integer  "permissible_id"
    t.string   "permissible_type"
    t.string   "action"
    t.boolean  "granted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_tags", ["photo_id"], :name => "index_photo_tags_on_photo_id"
  add_index "photo_tags", ["tag_id"], :name => "index_photo_tags_on_tag_id"

  create_table "photos", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "path"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "file"
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"
  add_index "photos", ["id"], :name => "index_photos_on_id", :unique => true

  create_table "preregisters", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["id"], :name => "index_tags_on_id", :unique => true

  create_table "user_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.string   "sex"
    t.date     "birthday"
    t.string   "hometown"
    t.string   "current_city"
    t.string   "religious_views"
    t.string   "political_views"
    t.string   "favorite_quotations"
    t.string   "interested_in"
    t.string   "looking_for"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
