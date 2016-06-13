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

ActiveRecord::Schema.define(version: 20160505165625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.text     "area_type"
    t.integer  "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentee_surveys", force: :cascade do |t|
    t.integer  "rating"
    t.boolean  "continue"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentees", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "location"
    t.integer  "age"
    t.text     "gender"
    t.text     "mentor_preferred_gender"
    t.text     "email"
    t.text     "phone"
    t.text     "preferred_communication"
    t.text     "how_did_you_hear"
    t.text     "addl_info"
    t.text     "challenge1"
    t.text     "challenge2"
    t.text     "challenge3"
    t.text     "password_digest"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mentor_surveys", force: :cascade do |t|
    t.integer  "rating"
    t.boolean  "continue"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "location"
    t.integer  "age"
    t.text     "gender"
    t.text     "mentee_preferred_gender"
    t.text     "email"
    t.text     "phone"
    t.text     "linkedin"
    t.text     "preferred_communication"
    t.text     "how_did_you_hear"
    t.text     "addl_info"
    t.text     "password_digest"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mentorships", force: :cascade do |t|
    t.integer  "mentee_id"
    t.integer  "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.text     "sender_type"
    t.integer  "recipient_id"
    t.integer  "recipient_type"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
