class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.string :title
      t.integer :user_left
      t.integer :user_right

      t.timestamps
    end
  end
end
