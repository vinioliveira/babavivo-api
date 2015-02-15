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

ActiveRecord::Schema.define(version: 20141111022545) do

  create_table "api_keys", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "championships", force: true do |t|
    t.string   "name"
    t.integer  "day_of_week"
    t.integer  "creator_id"
    t.time     "start_time"
    t.datetime "draw_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place"
    t.integer  "outfield_players"
    t.string   "type_teams"
  end

  add_index "championships", ["creator_id"], name: "index_championships_on_creator_id", using: :btree

  create_table "championships_metrics", force: true do |t|
    t.integer "championship_id"
    t.integer "metric_id"
  end

  create_table "championships_users", force: true do |t|
    t.integer "championship_id"
    t.integer "user_id"
  end

  create_table "classifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "championship_id"
    t.integer  "metric_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "name",                                null: false
    t.string   "nickname",                            null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "age"
    t.string   "position"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
