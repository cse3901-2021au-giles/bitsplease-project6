class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :User do |t|
      t.string :fname
      t.string :lname
      t.string :email
    end
  end
end
