class Post < ActiveRecord::Base
  attr_accessible :body, :school_id, :title, :user_id

  belongs_to :user
  has_many :comments
end
