class CreateDemonstrations < ActiveRecord::Migration
  def change
    create_table :demonstrations do |t|

      t.timestamps
    end
  end
end
