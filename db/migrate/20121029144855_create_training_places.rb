class CreateTrainingPlaces < ActiveRecord::Migration
  def change
    create_table :training_places do |t|
      t.string :name
      t.string :status
      t.text :about
      t.integer :school_id

      t.timestamps
    end
  end
end
