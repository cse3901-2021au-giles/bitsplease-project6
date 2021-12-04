class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :course, index: true, foreign_key: { to_table: :courses }
      t.timestamps
    end
  end
end
