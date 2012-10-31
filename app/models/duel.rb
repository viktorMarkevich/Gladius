class Duel < ActiveRecord::Base
  attr_accessible :title, :user_left, :user_right

  belongs_to :side_left, :foreign_key => "user_left", :class_name => "User"
  belongs_to :side_right, :foreign_key => "user_right", :class_name => "User"
end
