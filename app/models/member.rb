class Member < User

  has_many :user_school_relations, class_name: Member, foreign_key: :member_id
  has_many :schools, through: :user_school_relations

  accepts_nested_attributes_for :user_school_relations
end