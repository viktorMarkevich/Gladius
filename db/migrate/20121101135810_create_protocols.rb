class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :title
      t.integer :duel_id

      t.timestamps
    end
  end
end
