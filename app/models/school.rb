class School < ActiveRecord::Base
  attr_accessible :date_of_foundation, :info, :school_name, :status, :contact_info_attributes

  belongs_to :fighting_art

  has_one :contact_info, :as => :info_for
  has_many :training_places
  has_many :honors, :as => :item
  has_many :user_school_relations
  has_many :users, :through => :user_school_relations, :foreign_key => :user_id

  accepts_nested_attributes_for :contact_info
end
