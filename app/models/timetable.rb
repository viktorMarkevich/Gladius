class Timetable < ActiveRecord::Base
  attr_accessible :group_id, :hall_id, :time, :title, :weekday

  belongs_to :hall
  belongs_to :group
end
