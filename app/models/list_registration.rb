class ListRegistration < ActiveRecord::Base
  attr_accessible :title, :tournament_id

  belongs_to :tournament
  has_many :users
end
