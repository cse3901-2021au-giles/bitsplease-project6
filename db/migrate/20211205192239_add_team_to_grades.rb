class AddTeamToGrades < ActiveRecord::Migration[6.1]
  def change
    add_reference :grades, :team, null: false, foreign_key: true
  end
end
