class School < ActiveRecord::Base
  attr_accessible :date_of_foundation, :info, :name, :status, :creator_id, :contact_info_attributes

  belongs_to :fighting_art

  has_one :contact_info, :as => :info_for
  has_many :training_places
  has_many :honors, :as => :item
  has_many :user_school_relations, :dependent => :destroy
  has_many :members, :through => :user_school_relations, :class_name => "User"
  belongs_to :creator, :class_name => "User"

  accepts_nested_attributes_for :contact_info
end
