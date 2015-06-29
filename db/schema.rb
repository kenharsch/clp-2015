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

ActiveRecord::Schema.define(version: 20150628213824) do

  create_table "ahoy_events", id: false, force: true do |t|
    t.uuid     "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time"
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id"
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id"

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "draftDue"
    t.datetime "finalDue"
    t.boolean  "toGroup"
    t.boolean  "isPosted"
    t.datetime "toGroupOn"
    t.datetime "postedOn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "shallow",                 default: false
    t.boolean  "grammatical",             default: false
    t.boolean  "challenge",               default: false
    t.boolean  "quote",                   default: false
    t.boolean  "reply",                   default: false
    t.boolean  "author",                  default: false
    t.boolean  "analytical",              default: false
    t.boolean  "crit_low",                default: false
    t.boolean  "crit_med",                default: false
    t.boolean  "crit_high",               default: false
    t.boolean  "interaction_independent", default: false
    t.boolean  "interaction_quasi_int",   default: false
    t.boolean  "elaborative",             default: false
    t.boolean  "negotiating",             default: false
    t.boolean  "actv",                    default: false
    t.boolean  "exrtv",                   default: false
    t.boolean  "imrtv",                   default: false
    t.boolean  "egintv",                  default: false
    t.boolean  "inctv",                   default: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "evaluations", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "rating_1"
    t.integer  "rating_2"
    t.integer  "rating_3"
    t.text     "comment_1"
    t.text     "comment_2"
    t.text     "comment_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
    t.integer  "user_rank"
    t.boolean  "submitted",  default: false
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.integer  "problemID"
    t.text     "content"
    t.datetime "savedOn"
    t.datetime "toGroupOn"
    t.float    "grade"
    t.string   "grader"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "user_nickname"
    t.boolean  "togroup"
    t.integer  "prob"
    t.integer  "gid"
    t.text     "discussion"
    t.boolean  "wiki"
    t.integer  "ta_rank"
    t.text     "draft"
    t.boolean  "final"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "image_url"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "admin"
    t.boolean  "optout"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", id: false, force: true do |t|
    t.uuid     "visitor_id"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

end
