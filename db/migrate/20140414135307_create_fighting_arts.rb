class CreateFightingArts < ActiveRecord::Migration
  def change
    create_table :fighting_arts do |t|

      t.timestamps
    end
  end
end
