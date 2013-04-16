class DropHallsTable < ActiveRecord::Migration
  def up
    drop_table :halls
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
