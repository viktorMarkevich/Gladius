class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :tournament_id
      t.integer :type_nomination_id
      t.integer :params_nomination_id

      t.timestamps
    end
  end
end
