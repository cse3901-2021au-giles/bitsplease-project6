class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.integer :score
      t.references :student, index: true, foreign_key: {to_table: :users} 
      t.references :project, index: true, foreign_key: {to_table: :projects}
      t.timestamps
    end
  end
end
