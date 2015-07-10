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

ActiveRecord::Schema.define(version: 20150710003547) do

  create_table "chat_messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", force: true do |t|
    t.integer  "learner_id"
    t.integer  "coach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  create_table "coaches", force: true do |t|
    t.boolean "will_chat",           default: false
    t.boolean "will_call",           default: false
    t.boolean "is_available",        default: true
    t.text    "services"
    t.integer "user_id"
    t.string  "video_url"
    t.integer "call_rate"
    t.string  "bank_account_name"
    t.integer "bank_account_number"
    t.integer "bank_routing"
    t.string  "paypal_email"
  end

  create_table "language_relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "iso_639_1_code"
    t.string   "iso_639_2b_code"
    t.string   "iso_639_3_code"
    t.string   "native"
    t.string   "english"
    t.string   "french"
    t.string   "spanish"
    t.string   "chinese"
    t.string   "russian"
    t.string   "german"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learners", force: true do |t|
    t.text    "bio"
    t.text    "reason_why"
    t.integer "user_id"
    t.string  "card_name"
    t.integer "card_number"
    t.integer "card_verification"
    t.date    "card_expiration"
    t.string  "billing_country"
    t.string  "billing_street"
    t.string  "billing_city"
    t.string  "billing_state"
    t.integer "billing_zip"
    t.string  "stripe_customer_id"
  end

  create_table "ratings", force: true do |t|
    t.integer  "learner_id"
    t.integer  "coach_id"
    t.integer  "rating",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonials", force: true do |t|
    t.integer  "learner_id"
    t.integer  "coach_id"
    t.text     "content"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
