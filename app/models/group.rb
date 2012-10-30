class Group < ActiveRecord::Base
  attr_accessible :info, :name, :status

  has_many :timetables
  has_many :halls, :through => :timetables
  has_many :users
end
