class UserSchoolRelation < ActiveRecord::Base

  belongs_to :member, :class_name => "User"
  belongs_to :school

  ROLES = %w(student moderator manager admin)
  STATUS = %w(student sifu trainer)
  LEVEL = %w(0 1 2 3 4 5 6)

end