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

ActiveRecord::Schema.define(version: 20140123112152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "day"
    t.integer  "location_id"
    t.integer  "organizer_id"
    t.string   "responsible"
    t.boolean  "public",       default: false
    t.integer  "duration"
  end

  create_table "locations", force: true do |t|
    t.string "name"
    t.string "address"
    t.string "description"
  end

  create_table "organizers", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "location_id"
  end

  create_table "taggings", force: true do |t|
    t.integer "event_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
