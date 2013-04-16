class Group < ActiveRecord::Base
  attr_accessible :info, :name, :status, :school_id, :timetable

  belongs_to :school

  has_many :users
end
                                  ````