class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_no
      t.string :semester

      t.timestamps
    end
  end
end
