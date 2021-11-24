class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :user_id, index: true, foreign_key: {to_table: :users} 
      t.references :course_id, index: true, foreign_key: {to_table: :courses} 
      t.timestamps
    end
  end
end
