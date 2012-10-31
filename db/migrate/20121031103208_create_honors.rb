class CreateHonors < ActiveRecord::Migration
  def change
    create_table :honors do |t|
      t.string :name
      t.integer :item_id
      t.string :item_type
      t.integer :nomination_id

      t.timestamps
    end
  end
end
