class Article < ActiveRecord::Base

  belongs_to :school
  belongs_to :author, class_name: User

  validates_presence_of :school_id, :author_id
  validates_presence_of :title
  validates_length_of :title, in: 5..140, message: 'The name must be at least 5 characters and no more than 140 characters!'

end
