class Team < ActiveRecord::Base
  attr_accessible :name, :title

  has_many :users
  has_many :duels, :as => :fighter
end
