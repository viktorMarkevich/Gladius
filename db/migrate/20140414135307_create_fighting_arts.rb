class CreateFightingArts < ActiveRecord::Migration
  def change
    create_table :fighting_arts do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
