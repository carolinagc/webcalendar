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

ActiveRecord::Schema.define(version: 20131128162421) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "day"
    t.time     "time"
    t.integer  "location_id"
    t.integer  "organizer_id"
  end

  create_table "events_tags", force: true do |t|
    t.integer "event_id"
    t.integer "tag_id"
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

  create_table "tags", force: true do |t|
    t.string "tag"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
