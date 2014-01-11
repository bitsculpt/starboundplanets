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

ActiveRecord::Schema.define(version: 20140111160629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "astroid_fields", force: true do |t|
    t.string   "name"
    t.integer  "cluster_id"
    t.integer  "threat_level"
    t.text     "description"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clusters", force: true do |t|
    t.string   "name"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moons", force: true do |t|
    t.string   "name"
    t.integer  "cluster_id"
    t.string   "biome"
    t.integer  "threat_level"
    t.string   "username"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planets", force: true do |t|
    t.string   "biome",        null: false
    t.integer  "threat_level", null: false
    t.integer  "cluster_id"
    t.text     "description"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: true do |t|
    t.string   "name"
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
