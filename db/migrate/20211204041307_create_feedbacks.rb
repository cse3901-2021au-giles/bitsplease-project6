class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comment
      t.references :submitter, index: true, foreign_key: { to_table: :users }
      t.references :receiver, index: true, foreign_key: { to_table: :users }
      t.references :project, index: true, foreign_key: { to_table: :projects }
      t.timestamps
    end
  end
end
