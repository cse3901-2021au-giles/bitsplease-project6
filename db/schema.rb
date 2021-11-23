# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_180438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "course_no"
    t.string "semester"
    t.bigint "instructor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id_id"
    t.bigint "course_id_id"
    t.index ["course_id_id"], name: "index_enrollments_on_course_id_id"
    t.index ["user_id_id"], name: "index_enrollments_on_user_id_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "submitter_id"
    t.bigint "receiver_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_feedbacks_on_project_id"
    t.index ["receiver_id"], name: "index_feedbacks_on_receiver_id"
    t.index ["submitter_id"], name: "index_feedbacks_on_submitter_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "score"
    t.bigint "student_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_grades_on_project_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_projects_on_course_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_teams_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "courses", "users", column: "instructor_id"
  add_foreign_key "enrollments", "courses", column: "course_id_id"
  add_foreign_key "enrollments", "users", column: "user_id_id"
  add_foreign_key "feedbacks", "projects"
  add_foreign_key "feedbacks", "users", column: "receiver_id"
  add_foreign_key "feedbacks", "users", column: "submitter_id"
  add_foreign_key "grades", "projects"
  add_foreign_key "grades", "users", column: "student_id"
  add_foreign_key "projects", "courses"
  add_foreign_key "teams", "users", column: "student_id"
end
