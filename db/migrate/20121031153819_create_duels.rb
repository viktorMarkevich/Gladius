class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.string :title
      t.integer :item_left_id
      t.string :item_left_type
      t.integer :item_right_id
      t.string :item_right_type
      t.string :type
      t.string :winner
      t.integer :nomination_id

      t.timestamps
    end
  end
end
