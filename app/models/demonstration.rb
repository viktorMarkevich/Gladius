class Demonstration < ActiveRecord::Base

  has_many :articles, as: :articlable
end
