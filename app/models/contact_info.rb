class ContactInfo < ActiveRecord::Base

  belongs_to :info_for, :polymorphic => true
end
