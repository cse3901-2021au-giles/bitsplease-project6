class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_no
      t.string :semester
      t.references :instructor, index: true, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end
