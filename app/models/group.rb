class Group < ActiveRecord::Base
  attr_accessible :info, :name, :status

  belongs_to :hall
  has_many :users
end
