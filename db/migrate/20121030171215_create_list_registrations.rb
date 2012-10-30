class CreateListRegistrations < ActiveRecord::Migration
  def change
    create_table :list_registrations do |t|
      t.string :title
      t.integer :tournament_id

      t.timestamps
    end
  end
end
