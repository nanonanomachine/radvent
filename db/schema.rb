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

ActiveRecord::Schema.define(version: 20141125152431) do

  create_table "advent_calendar_items", force: true do |t|
    t.string   "user_name"
    t.string   "comment"
    t.integer  "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.integer  "advent_calendar_item_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["advent_calendar_item_id"], name: "index_attachments_on_advent_calendar_item_id"

  create_table "comments", force: true do |t|
    t.integer  "item_id"
    t.string   "user_name"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id"

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "advent_calendar_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["advent_calendar_item_id"], name: "index_items_on_advent_calendar_item_id", unique: true

end
