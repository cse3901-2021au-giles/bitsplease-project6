class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.has_one :student, class_name: 'user'
      t.has_one :course
      t.timestamps
    end
  end
end
