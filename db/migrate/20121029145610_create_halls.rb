class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :name
      t.text :about
      t.float :room_area
      t.string :status

      t.timestamps
    end
  end
end
