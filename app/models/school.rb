class School < ActiveRecord::Base

  belongs_to :fighting_art
  belongs_to :creator, :class_name => "User"

  has_one :contact_info, :as => :info_for
  has_many :user_school_relations, :dependent => :destroy
  has_many :members, :through => :user_school_relations

  accepts_nested_attributes_for :contact_info
end
