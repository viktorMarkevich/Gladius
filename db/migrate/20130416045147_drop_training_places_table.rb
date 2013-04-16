class DropTrainingPlacesTable < ActiveRecord::Migration
  def up
    drop_table :training_places
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
