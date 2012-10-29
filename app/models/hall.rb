class Hall < ActiveRecord::Base
  attr_accessible :about, :name, :room_area, :status

  belongs_to :training_place
  has_many :groups
end
