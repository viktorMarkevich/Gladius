class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.datetime :birthday
      t.string :sex
      t.float :weight
      t.integer :level
      t.string :status
      t.string :country
      t.string :city
      t.string :address
      t.text :about
      t.integer :group_id
      t.integer :list_registration_id
      t.integer :team_id
      t.integer :role_id

      t.timestamps
    end
  end
end
