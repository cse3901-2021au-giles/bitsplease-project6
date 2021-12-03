class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comment
      t.belongs_to :project
      t.has_one :submitter, class_name: 'user'
      t.has_one :project
      t.timestamps
    end
  end
end
