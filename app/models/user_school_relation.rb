class UserSchoolRelation < ActiveRecord::Base
  attr_accessible :school_id, :user_id

  belongs_to :user
  belongs_to :school, :counter_cache => true

  scope :get_school_id, lambda { | user | where( :user_id   => user.id)}
  scope :get_cross, lambda {
          | user1_id, user2_id | joins("JOIN user_school_relations usr on
          usr.school_id = user_school_relations.school_id").where(
          "user_school_relations.user_id = ? and usr.user_id = ?", user1_id, user2_id)
                            }
end
