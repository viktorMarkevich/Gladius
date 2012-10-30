class TrainingPlace < ActiveRecord::Base
  attr_accessible :about, :address, :city, :name, :status, :type

  belongs_to :school
  has_many :contact_infos, :as => :info_for
  has_many :halls
end
