class FightingArt < ActiveRecord::Base
  #attr_accessible :name, :title

  has_many :schools
end
