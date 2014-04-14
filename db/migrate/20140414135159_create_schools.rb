class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.datetime :date_of_foundation
      t.string :status
      t.text :info
      t.integer :creator_id

      t.timestamps
    end
  end
end