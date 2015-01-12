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

ActiveRecord::Schema.define(version: 20150112031016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: true do |t|
    t.string   "phone_number"
    t.string   "alias_name"
    t.boolean  "lock",         default: false
    t.boolean  "moving",       default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "message"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "tracking_route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_routes", force: true do |t|
    t.integer  "device_id"
    t.datetime "started_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracking_routes", ["device_id"], name: "index_tracking_routes_on_device_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "facebook_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id"
  end

end
