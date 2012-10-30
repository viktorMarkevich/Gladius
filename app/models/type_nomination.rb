class TypeNomination < ActiveRecord::Base
  attr_accessible :title

  has_many :nominations
end
