class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :title
      t.string :name
      t.text :about
      t.float :room_area
      t.string :status
      t.integer :training_place_id

      t.timestamps
    end
  end
end
