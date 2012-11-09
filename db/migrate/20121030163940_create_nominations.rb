class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :title
      t.string :name
      t.integer :tournament_id
      t.integer :type_nomination_id
      t.integer :params_nomination_id
      t.integer :list_registration_id
      t.time :start_time_nomination
      t.time :end_time_nomination

      t.timestamps
    end
  end
end
