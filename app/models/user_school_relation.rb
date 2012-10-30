class UserSchoolRelation < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  belongs_to :school
end
