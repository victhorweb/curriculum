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

ActiveRecord::Schema.define(:version => 20140513311121) do

  create_table "avaliables", :force => true do |t|
    t.integer  "person_id"
    t.integer  "skill_id"
    t.integer  "level_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vacant_id"
  end

  create_table "cities", :force => true do |t|
    t.integer  "states_id"
    t.string   "uf"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "corrections", :force => true do |t|
    t.integer  "person_id"
    t.integer  "vacant_id"
    t.integer  "skill_id"
    t.integer  "level_id"
    t.integer  "number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "person_question_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "essays", :force => true do |t|
    t.string   "question"
    t.integer  "skill"
    t.integer  "level"
    t.string   "reply"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inscritions", :force => true do |t|
    t.integer  "person_id"
    t.integer  "vacant_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status_id"
  end

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "score"
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
    t.string   "password"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "status_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.string   "facebook"
  end

  create_table "person_questions", :force => true do |t|
    t.integer  "person_id"
    t.integer  "essay_id"
    t.integer  "vacant_id"
    t.string   "replay"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "skill_levels", :force => true do |t|
    t.integer  "person_id"
    t.integer  "skill_id"
    t.integer  "level_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vacant_id"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sector_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "score"
  end

  create_table "states", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
