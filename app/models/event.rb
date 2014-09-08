class Event < ActiveRecord::Base

  self.per_page = 10

  has_many :articles, as: :articlable
end
