class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.integer :score
      t.belongs_to :student, class_name: 'user'
      t.has_one :project
      t.timestamps
    end
  end
end
