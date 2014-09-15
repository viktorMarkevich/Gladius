class Article < ActiveRecord::Base

  belongs_to :school
  belongs_to :author, class_name: User, foreign_key: :author_id
  belongs_to :admin_author, class_name: AdminUser, foreign_key: :admin_author_id

  validates :school_id, presence: true, unless: Proc.new { |a| a.admin_author.present? }
  validates :author_id, presence: true, unless: Proc.new { |a| a.admin_author.present? }

  validates_presence_of :title
  validates_length_of :title, in: 5..140, message: 'The name must be at least 5 characters and no more than 140 characters!'

  ARTICLE_TYPES = %w( event demonstration )
end
