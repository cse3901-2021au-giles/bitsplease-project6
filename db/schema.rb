# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_03_050732) do

  create_table "courses", force: :cascade do |t|
    t.string "course_no"
    t.string "semester"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
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
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin"
    t.string "user_role", default: "student"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feedbacks", "projects"
  add_foreign_key "feedbacks", "users", column: "receiver_id"
  add_foreign_key "feedbacks", "users", column: "submitter_id"
  add_foreign_key "grades", "projects"
  add_foreign_key "grades", "users", column: "student_id"
  add_foreign_key "projects", "courses"
end
