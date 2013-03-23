class ContactInfo < ActiveRecord::Base
  attr_accessible :name, :info_for_id, :info_for_type, :country, :address, :city, :site, :skype, :phone

  belongs_to :info_for, :polymorphic => true
end
