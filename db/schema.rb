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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120910123622) do

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.boolean  "completed",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "parent_id"
    t.integer  "position"
  end

  add_index "steps", ["parent_id"], :name => "index_steps_on_parent_id"
  add_index "steps", ["task_id"], :name => "index_steps_on_task_id"

  create_table "tasks", :force => true do |t|
    t.integer  "tracks_id"
    t.string   "description"
    t.text     "notes"
    t.date     "due_at"
    t.integer  "order",         :default => 0
    t.integer  "line_order",    :default => 1
    t.string   "state",         :default => "active"
    t.boolean  "line",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completedness", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
