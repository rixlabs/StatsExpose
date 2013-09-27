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

ActiveRecord::Schema.define(version: 20130927120811) do

  create_table "dashboards", force: true do |t|
    t.string   "layout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "widgets", force: true do |t|
    t.integer  "dashboard_id"
    t.integer  "sequence"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "size"
    t.string   "endpoint"
    t.string   "chart_type"
    t.string   "title"
    t.string   "indicator"
    t.text     "description"
  end

  add_index "widgets", ["dashboard_id"], name: "index_widgets_on_dashboard_id"

end
