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

ActiveRecord::Schema.define(version: 20171105014312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", id: :serial, force: :cascade do |t|
    t.text "area_type"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentees", id: :serial, force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "location"
    t.integer "age"
    t.text "gender"
    t.text "mentor_preferred_gender"
    t.text "email"
    t.text "phone"
    t.text "preferred_communication"
    t.text "how_did_you_hear"
    t.text "addl_info"
    t.text "challenge1"
    t.text "challenge2"
    t.text "challenge3"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", id: :serial, force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "location"
    t.integer "age"
    t.text "gender"
    t.text "mentee_preferred_gender"
    t.text "email"
    t.text "phone"
    t.text "linkedin"
    t.text "preferred_communication"
    t.text "how_did_you_hear"
    t.text "addl_info"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentorships", id: :serial, force: :cascade do |t|
    t.integer "mentee_id"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
