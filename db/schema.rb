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

ActiveRecord::Schema.define(:version => 20130730140226) do

  create_table "cities", :id => false, :force => true do |t|
    t.integer "id",                                      :null => false
    t.integer "states_id"
    t.string  "uf",        :limit => 4,  :default => "", :null => false
    t.string  "name",      :limit => 50, :default => "", :null => false
  end

  add_index "cities", ["id"], :name => "id", :unique => true
  add_index "cities", ["id"], :name => "id_2"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "essays", :force => true do |t|
    t.string   "question"
    t.integer  "skill_id"
    t.integer  "level_id"
    t.string   "reply"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "mobile_phone"
    t.integer  "university_id"
    t.integer  "course_id"
    t.integer  "semester"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "work"
    t.string   "video_conf"
    t.string   "curriculum"
    t.integer  "sector_id"
    t.string   "image"
    t.string   "email"
    t.date     "born_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "password"
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sector_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.string "uf",   :limit => 10, :default => "", :null => false
    t.string "name", :limit => 20, :default => "", :null => false
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "phone"
    t.string   "address"
    t.string   "district"
    t.string   "zip_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vacants", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.date     "date_end"
    t.integer  "sector_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
