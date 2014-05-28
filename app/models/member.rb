class Member < User

  has_one :user_school_relation
  has_one :school, through: :user_school_relation

  accepts_nested_attributes_for :user_school_relation
end