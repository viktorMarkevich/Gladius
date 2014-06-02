class Member < User

  has_one :image, foreign_key: 'user_id'
  has_one :user_school_relation, dependent: :destroy
  has_one :school, through: :user_school_relation

  accepts_nested_attributes_for :user_school_relation, update_only: true
  accepts_nested_attributes_for :image

  after_create :member?

  def member?
    self.kind = 'Member'
    self.save
  end
end