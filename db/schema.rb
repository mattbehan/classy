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

ActiveRecord::Schema.define(version: 20151005192043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "gender",       null: false
    t.integer  "grade",        null: false
    t.float    "gpa",          null: false
    t.integer  "detentions",   null: false
    t.string   "t_shirt_size", null: false
    t.integer  "teacher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["teacher_id"], name: "index_students_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.boolean  "admin",                default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "email",                default: "",    null: false
    t.string   "encrypted_password",   default: "",    null: false
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree

end
