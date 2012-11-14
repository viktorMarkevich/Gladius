class School < ActiveRecord::Base
  attr_accessible :address, :city, :country, :date_of_foundation, :info, :school_name, :status

  belongs_to :fighting_art

  has_many :user_school_relations
  has_many :users, :through => :user_school_relations
  has_many :contact_info, :as => :info_for
  has_many :training_places
  has_many :honors, :as => :item

  accepts_nested_attributes_for :contact_info
end
