class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comment
      t.timestamps
    end
  end
end
