class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.references :student, index: true, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end
