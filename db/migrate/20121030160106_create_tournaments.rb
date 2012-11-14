class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :title
      t.string :name
      t.string :status
      t.string :status_competition
      t.datetime :start_tournament
      t.datetime :end_tournament
      t.text :info

      t.timestamps
    end
  end
end
