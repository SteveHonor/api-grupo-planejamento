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

ActiveRecord::Schema.define(version: 20180622215017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "house_images", force: :cascade do |t|
    t.integer  "house_id"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_house_images_on_house_id", using: :btree
  end

  create_table "houses", force: :cascade do |t|
    t.string   "title"
    t.integer  "bedrooms",     default: 0
    t.integer  "bathrooms",    default: 0
    t.integer  "places",       default: 0
    t.integer  "suites",       default: 0
    t.string   "price"
    t.string   "address"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.string   "status",       default: "pending"
    t.string   "kind"
    t.string   "situation"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "meters"
    t.string   "code"
    t.integer  "visits",       default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "mail_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mail_newsletters", force: :cascade do |t|
    t.string   "mail"
    t.string   "origin"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solars", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "state"
    t.string   "place"
    t.string   "current_price"
    t.string   "connection_type"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "house_images", "houses"
end
