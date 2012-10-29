class School < ActiveRecord::Base
  attr_accessible :address, :city, :country, :date_of_foundation, :info, :school_name, :status

  has_many :user_school_relations
  has_many :users, :through => :user_school_relations
  has_many :contact_infos, :as => :info_for
end
