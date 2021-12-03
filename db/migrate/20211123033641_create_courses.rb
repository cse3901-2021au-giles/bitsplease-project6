class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_no
      t.string :semester
      t.has_many :students, through: :enrollments, source: :enrollments_table_foreign_key_to_students_table
      t.has_many :enrollments
      t.timestamps
    end
  end
end
