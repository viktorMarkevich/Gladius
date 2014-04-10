class ParamsNomination < ActiveRecord::Base
  #attr_accessible :max_age, :max_weight, :min_age, :min_weight, :sex

  has_many :nominations
end
