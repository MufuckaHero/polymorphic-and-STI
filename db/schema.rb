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

ActiveRecord::Schema.define(version: 20151010022756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "filename"
    t.string   "content_type"
    t.string   "type"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments", force: true do |t|
    t.string   "author_name"
    t.string   "author_email"
    t.text     "content"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["target_id", "target_type"], name: "index_comments_on_target_id_and_target_type", using: :btree

  create_table "dm_models_headers", force: true do |t|
    t.string  "name",      limit: 50
    t.string  "value",     limit: 50
    t.integer "report_id"
  end

  create_table "dm_models_links", force: true do |t|
    t.string  "name",      limit: 50
    t.string  "href",      limit: 50
    t.string  "rel",       limit: 50
    t.string  "target",    limit: 50
    t.integer "report_id"
  end

  create_table "dm_models_reports", force: true do |t|
    t.string   "url",  limit: 50
    t.datetime "time"
    t.string   "ip",   limit: 39
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "address"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tag_ids",    default: [],              array: true
  end

  add_index "events", ["tag_ids"], name: "index_events_on_tag_ids", using: :gin

  create_table "headers", id: false, force: true do |t|
    t.integer "id",        default: "nextval('headers_id_seq'::regclass)", null: false
    t.text    "key"
    t.text    "value"
    t.integer "report_id"
  end

  create_table "links", id: false, force: true do |t|
    t.integer "id",                   default: "nextval('links_id_seq'::regclass)", null: false
    t.text    "name"
    t.text    "href"
    t.text    "rel"
    t.string  "target",    limit: 15
    t.integer "report_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tag_ids",    default: [],              array: true
  end

  add_index "posts", ["tag_ids"], name: "index_posts_on_tag_ids", using: :gin

  create_table "reports", id: false, force: true do |t|
    t.integer "id",   default: "nextval('reports_id_seq'::regclass)", null: false
    t.text    "url"
    t.text    "time"
    t.text    "ip"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
