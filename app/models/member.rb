class Member < User

  has_many :user_school_relations
  has_many :schools, :through => :user_school_relations

  accepts_nested_attributes_for :contact_info, :user_school_relations
end