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

ActiveRecord::Schema.define(version: 20180805193642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", id: :serial, force: :cascade do |t|
    t.text "area_type"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentorships", force: :cascade do |t|
    t.bigint "mentor_id", null: false
    t.bigint "mentee_id", null: false
    t.index ["mentee_id"], name: "index_mentorships_on_mentee_id"
    t.index ["mentor_id"], name: "index_mentorships_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.integer "age"
    t.string "gender"
    t.string "mentee_preferred_gender"
    t.string "mentor_preferred_gender"
    t.string "phone"
    t.string "linkedin"
    t.string "preferred_communication"
    t.string "how_did_you_hear"
    t.string "addl_info"
    t.string "challenge1"
    t.string "challenge2"
    t.string "challenge3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mentorships", "users", column: "mentee_id"
  add_foreign_key "mentorships", "users", column: "mentor_id"
end
