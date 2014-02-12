# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140212214146) do

  create_table "donations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "donationId"
  end

  create_table "playlists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "race_id"
  end

  create_table "playlists_songs", force: true do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  create_table "races", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "date"
    t.integer  "target"
    t.integer  "route_id"
    t.integer  "user_id"
    t.integer  "playlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mainImage_file_name"
    t.string   "mainImage_content_type"
    t.integer  "mainImage_file_size"
    t.datetime "mainImage_updated_at"
    t.string   "secondImage_file_name"
    t.string   "secondImage_content_type"
    t.integer  "secondImage_file_size"
    t.datetime "secondImage_updated_at"
    t.string   "thirdImage_file_name"
    t.string   "thirdImage_content_type"
    t.integer  "thirdImage_file_size"
    t.datetime "thirdImage_updated_at"
  end

# Could not dump table "songs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isRunner",         default: false
  end

end
