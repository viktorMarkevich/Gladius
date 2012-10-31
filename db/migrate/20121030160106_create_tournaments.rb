class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :title
      t.string :country
      t.string :city
      t.string :address
      t.string :status
      t.string :status_competition
      t.datetime :start_tournament
      t.datetime :end_tournament
      t.text :info

      t.timestamps
    end
  end
end
