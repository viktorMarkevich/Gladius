class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :status
      t.text :info

      t.timestamps
    end
  end
end
