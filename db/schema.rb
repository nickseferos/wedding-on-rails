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

ActiveRecord::Schema.define(version: 20180415210108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "event_notifications", force: true do |t|
    t.string   "notification_type"
    t.integer  "guest_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "location"
    t.boolean  "active"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "partner_one"
    t.string   "partner_two"
    t.string   "venue_name"
    t.string   "venue_address_line_one"
    t.string   "venue_address_line_two"
    t.string   "venue_address_city"
    t.string   "venue_address_state"
    t.string   "venue_address_zip"
    t.string   "venue_address_country"
    t.integer  "primary_venue_photo"
    t.text     "venue_body"
    t.text     "venue_directions"
  end

  create_table "groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rsvp",       default: false
    t.integer  "event_id"
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.boolean  "rsvp"
    t.boolean  "invited_to_ceremony"
    t.boolean  "invited_to_evening"
    t.boolean  "vegetarian"
    t.integer  "group_size"
    t.boolean  "arrival_transportation_required"
    t.boolean  "departing_transport_requred"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "event_id"
  end

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "image"
    t.string   "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
    t.text     "bio"
  end

  add_index "parties", ["event_id"], name: "index_parties_on_event_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "sections", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_lists", force: true do |t|
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "event_id"
    t.integer  "task_list_id"
    t.boolean  "completed"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_photos", force: true do |t|
    t.string   "file"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
