class UserSchoolRelation < ActiveRecord::Base
  attr_accessible :school_id, :user_id

  belongs_to :user
  belongs_to :school

  scope :get_user, lambda { |user| where(:user_id => user.id, :school_id => nil)}
end
