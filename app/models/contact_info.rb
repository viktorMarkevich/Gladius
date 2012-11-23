class ContactInfo < ActiveRecord::Base
  attr_accessible :name, :info_for_id, :info_for_type, :info_for_attributes, :sites_attributes, :phones_attributes,
                  :skypes_attributes, :emails_attributes, :country, :address, :city

  belongs_to :info_for, :polymorphic => true

  has_many :phones, :dependent => :delete_all
  has_many :skypes, :dependent => :delete_all
  has_many :emails, :dependent => :delete_all
  has_many :sites, :dependent => :delete_all

  accepts_nested_attributes_for :info_for, :sites, :phones, :emails, :skypes
end
