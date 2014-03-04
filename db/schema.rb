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

ActiveRecord::Schema.define(:version => 20140303234356) do

  create_table "attachments", :force => true do |t|
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attachments_news", :force => true do |t|
    t.integer "attachment_id"
    t.integer "news_id"
  end

  create_table "base_reservations", :force => true do |t|
    t.string   "starts_at"
    t.string   "day"
    t.integer  "team_id"
    t.string   "created_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "activity_type"
  end

  create_table "craigslist_items", :force => true do |t|
    t.string   "date"
    t.string   "contactName"
    t.string   "number"
    t.text     "textBody"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "publisher_id"
    t.datetime "published_at"
    t.datetime "edited_at"
    t.integer  "edited_by_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.integer  "team_id"
    t.integer  "number"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reservations", :force => true do |t|
    t.string   "starts_at"
    t.date     "date"
    t.integer  "team_id"
    t.string   "created_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "display_text"
    t.string   "display_activity"
    t.string   "activity_type"
  end

  create_table "staff_members", :force => true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "role"
    t.string   "email"
    t.string   "phone"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "homepage"
    t.string   "picture_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "f_name",                 :default => "", :null => false
    t.string   "l_name",                 :default => "", :null => false
    t.string   "role",                   :default => "", :null => false
    t.integer  "team_id",                :default => 0,  :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
