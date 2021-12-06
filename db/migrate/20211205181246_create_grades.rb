
#see the article for help: https://dev.to/luchiago/multiple-foreign-keys-for-the-same-model-in-rails-6-7ml
class CreateGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.float :score
      t.text :remarks

      t.timestamps
      t.references :student, null: false, foreign_key: {to_table: :users}
      t.references :reviewer, null: false, foreign_key: {to_table: :users}
    end
  end
end
