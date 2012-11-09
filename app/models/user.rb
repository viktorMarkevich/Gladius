class User < ActiveRecord::Base
  attr_accessible :about, :address, :birthday, :city, :country, :first_name, :last_name, :level, :second_name, :sex, :status, :weight

  belongs_to :group
  belongs_to :list_registration
  belongs_to :role
  belongs_to :team

  has_many :user_school_relations
  has_many :schools, :through => :user_school_relations
  has_many :contact_infos, :as => :info_for
  has_many :honors, :as => :item
  has_many :duels, :as => :fighter
  has_many :comments
  has_many :posts
end
