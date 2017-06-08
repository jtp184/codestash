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

ActiveRecord::Schema.define(version: 20170608051626) do

  create_table "codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stash_bots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "prefs",       limit: 65535
    t.string   "secret_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "stash_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "stash_id"
    t.text     "text_content",      limit: 65535
    t.string   "kind"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["stash_id"], name: "index_stash_elements_on_stash_id", using: :btree
  end

  create_table "stashes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "code_id"
    t.boolean  "finalized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_stashes_on_code_id", using: :btree
  end

end
