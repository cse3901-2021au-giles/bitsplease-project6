class AddProjectToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :project, null: true, foreign_key: true
  end
end
