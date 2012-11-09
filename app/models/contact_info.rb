class ContactInfo < ActiveRecord::Base
  attr_accessible :name

  belongs_to :info_for, :polymorphic => true

  has_many :phones
  has_many :skypes
  has_many :emails
  has_many :sites
end
