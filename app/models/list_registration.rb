class ListRegistration < ActiveRecord::Base
  attr_accessible :title, :tournament_id

  has_many :users
  has_many :nominations
end
