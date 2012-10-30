class Tournament < ActiveRecord::Base
  attr_accessible :address, :city, :country, :info, :status, :status_competition, :title

  has_many :nominations
  has_many :list_registrations
end
