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

ActiveRecord::Schema.define(version: 20141030100256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.string   "status",     default: "Not Started"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "num_employees"
    t.float    "rating"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "img_url"
  end

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.integer  "primary_phone",   limit: 8
    t.integer  "secondary_phone", limit: 8
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "jobs", force: true do |t|
    t.integer  "average_pay"
    t.text     "description"
    t.string   "name"
    t.text     "qualifications"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "tasks", force: true do |t|
    t.datetime "due_date"
    t.text     "notes_before"
    t.text     "notes_after"
    t.integer  "contact_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.boolean  "pending",        default: true
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code",               limit: 2
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
