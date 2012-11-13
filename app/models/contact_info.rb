class ContactInfo < ActiveRecord::Base
  attr_accessible :name, :info_for_id, :info_for_type, :info_for_attributes, :sites_attributes, :phones_attributes,
                  :skypes_attributes, :emails_attributes

  belongs_to :info_for, :polymorphic => true

  has_many :phones
  has_many :skypes
  has_many :emails
  has_many :sites

  accepts_nested_attributes_for :info_for, :sites, :phones
end
