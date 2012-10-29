class CreateTrainingPlaces < ActiveRecord::Migration
  def change
    create_table :training_places do |t|
      t.string :type
      t.string :name
      t.string :city
      t.string :address
      t.string :status
      t.text :about

      t.timestamps
    end
  end
end
