class UserSchoolRelation < ActiveRecord::Base
  attr_accessible :school_id, :user_id

  belongs_to :user
  belongs_to :school, :counter_cache => true

  scope :get_user, lambda { |user| where(:user_id => user.id, :school_id => nil)}
  scope :users_for_school, lambda { |school_id| where(:school_id => school_id)}
end
