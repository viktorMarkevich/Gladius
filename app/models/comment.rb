class Comment < ActiveRecord::Base
  #attr_accessible :body, :post_id, :title, :user_id

  belongs_to :user
  belongs_to :post
end
