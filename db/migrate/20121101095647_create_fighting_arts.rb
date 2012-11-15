class CreateFightingArts < ActiveRecord::Migration
  def change
    create_table :fighting_arts do |t|
      t.string :title
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end