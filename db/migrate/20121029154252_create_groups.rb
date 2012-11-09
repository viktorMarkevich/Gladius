class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :name
      t.string :status
      t.text :info
      t.integer :hall_id

      t.timestamps
    end
  end
end
