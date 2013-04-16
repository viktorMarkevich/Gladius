class DropTimetablesTable < ActiveRecord::Migration
  def up
    drop_table :timetables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
