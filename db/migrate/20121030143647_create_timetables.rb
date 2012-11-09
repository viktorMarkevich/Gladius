class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :title
      t.integer :weekday
      t.integer :group_id
      t.integer :hall_id
      t.time :time

      t.timestamps
    end
  end
end
