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

ActiveRecord::Schema.define(version: 2019_08_21_001439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classroom_semesters", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_semesters_on_classroom_id"
    t.index ["semester_id"], name: "index_classroom_semesters_on_semester_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_classrooms_on_teacher_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "quarter"
    t.date "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_semesters", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_grade"
    t.index ["semester_id"], name: "index_student_semesters_on_semester_id"
    t.index ["student_id"], name: "index_student_semesters_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grade"
    t.integer "score"
    t.integer "teacher_id"
    t.integer "classroom_id"
  end

  create_table "teacher_semesters", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_grade"
    t.index ["semester_id"], name: "index_teacher_semesters_on_semester_id"
    t.index ["teacher_id"], name: "index_teacher_semesters_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
  end

  add_foreign_key "classroom_semesters", "classrooms"
  add_foreign_key "classroom_semesters", "semesters"
  add_foreign_key "student_semesters", "semesters"
  add_foreign_key "student_semesters", "students"
  add_foreign_key "teacher_semesters", "semesters"
  add_foreign_key "teacher_semesters", "teachers"
end
