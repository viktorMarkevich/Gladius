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

ActiveRecord::Schema.define(version: 20130416044637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   default: "admin"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_infos", force: true do |t|
    t.string   "name"
    t.integer  "info_for_id"
    t.string   "info_for_type"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "site"
    t.string   "skype"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "duels", force: true do |t|
    t.string   "title"
    t.integer  "item_left_id"
    t.string   "item_left_type"
    t.integer  "item_right_id"
    t.string   "item_right_type"
    t.string   "type"
    t.string   "winner"
    t.integer  "nomination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fighting_arts", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "status"
    t.text     "info"
    t.integer  "hall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.text     "timetable"
  end

  create_table "honors", force: true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "nomination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_registrations", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominations", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.integer  "tournament_id"
    t.integer  "type_nomination_id"
    t.integer  "params_nomination_id"
    t.integer  "list_registration_id"
    t.time     "start_time_nomination"
    t.time     "end_time_nomination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "params_nominations", force: true do |t|
    t.string   "sex"
    t.float    "min_weight"
    t.float    "max_weight"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protocols", force: true do |t|
    t.string   "title"
    t.integer  "duel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "date_of_foundation"
    t.string   "status"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_school_relations_count", default: 0
    t.integer  "creator_id"
  end

  create_table "string_protocols", force: true do |t|
    t.string   "title"
    t.float    "value"
    t.integer  "type_string_protocol_id"
    t.integer  "protocol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "status"
    t.string   "status_competition"
    t.datetime "start_tournament"
    t.datetime "end_tournament"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_nominations", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_parts", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_string_protocols", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_school_relations", force: true do |t|
    t.integer  "member_id"
    t.integer  "school_id"
    t.integer  "level",      default: 0
    t.string   "status",     default: "student"
    t.string   "role",       default: "student"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.date     "birthday"
    t.boolean  "sex",                    default: false
    t.float    "weight"
    t.text     "about"
    t.integer  "group_id"
    t.integer  "list_registration_id"
    t.integer  "team_id"
    t.string   "role",                   default: "fighter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
