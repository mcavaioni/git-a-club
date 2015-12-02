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

ActiveRecord::Schema.define(version: 20151202141637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.integer  "provider_profile_id"
    t.integer  "golf_set_id"
    t.string   "type"
    t.string   "brand"
    t.string   "shaft_stiffness"
    t.boolean  "male"
    t.boolean  "righty"
    t.string   "feature"
    t.integer  "price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "golf_sets", force: :cascade do |t|
    t.string   "summary"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "listable_type"
    t.integer  "listable_id"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "listings", ["listable_id", "listable_type"], name: "index_listings_on_listable_id_and_listable_type", using: :btree

  create_table "provider_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "renter_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "renter_profile_id"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.integer  "listing_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reviews", ["reviewable_id", "reviewable_type"], name: "index_reviews_on_reviewable_id_and_reviewable_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
