class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :course, index: true, foreign_key: {to_table: :courses} 
      t.timestamps
    end
  end
end
