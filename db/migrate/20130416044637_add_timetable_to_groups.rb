class AddTimetableToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :timetable, :text
  end
end