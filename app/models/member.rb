class Member < ActiveRecord::Base
  attr_accessible :school_id, :member_id, :role, :status, :level
  belongs_to :user
  belongs_to :school

  ROLES = %w(student moderator manager admin)
  STATUS = %w(student sifu trainer)
  LEVEL = %w(0 1 2 3 4 5 6)

end