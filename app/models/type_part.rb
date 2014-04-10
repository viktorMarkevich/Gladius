class TypePart < ActiveRecord::Base
  #attr_accessible :name, :title

  has_many :duels
end
