class NewsBulletin < ActiveRecord::Base

  has_many :articles, as: :articlable
end
