class CreateJoinTableCourseUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :users do |t|
      # t.index [:course_id, :user_id]
      # t.index [:user_id, :course_id]
    end
    add_foreign_key :courses_users, :users
    add_foreign_key :courses_users, :courses
  
  end
end
