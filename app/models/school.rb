class School < ActiveRecord::Base

  belongs_to :fighting_art
  belongs_to :creator, class_name: User, foreign_key: :creator_id

  has_one :contact_info, as: :info_for
  has_many :user_school_relations, dependent: :destroy
  has_many :members, through: :user_school_relations
  has_many :articles, dependent: :destroy

  accepts_nested_attributes_for :contact_info

  validates_presence_of :name
  validates_presence_of :creator_id
  validates_uniqueness_of :name
  validates_length_of :name, in: 5..40, message: 'The name must be at least 5 characters and no more than 40 characters!'
end
