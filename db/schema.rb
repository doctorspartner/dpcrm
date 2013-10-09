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

ActiveRecord::Schema.define(version: 20130929122956) do

  create_table "companies", force: true do |t|
    t.string   "name",                             null: false
    t.string   "tags"
    t.string   "assigned_to"
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "comments"
    t.string   "support_package", default: "Gold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "tags"
    t.string   "assigned_to"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "comments"
    t.string   "conference"
    t.string   "support_package"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

end
