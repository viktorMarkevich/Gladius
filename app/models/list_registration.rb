class ListRegistration < ActiveRecord::Base

  has_many :users
  has_many :nominations
end
