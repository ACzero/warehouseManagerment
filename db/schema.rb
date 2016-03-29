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

ActiveRecord::Schema.define(version: 20160329121808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer  "total_amount"
    t.float    "total_price"
    t.integer  "good_id"
    t.integer  "trader_id"
    t.string   "trader_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "phone_number"
    t.string   "address"
    t.string   "bank_account_number"
    t.string   "bank_account_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "deliver_histories", force: :cascade do |t|
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string   "name"
    t.integer  "type",       default: 0
    t.string   "origin"
    t.string   "store"
    t.integer  "percentage"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "product_id"
  end

  create_table "pay_histories", force: :cascade do |t|
    t.float    "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "phone_number"
    t.string   "address"
    t.string   "bank_account_number"
    t.string   "bank_account_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
