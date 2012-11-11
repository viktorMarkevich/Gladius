class Email < ActiveRecord::Base
  attr_accessible :name, :contact_info_id

  belongs_to :contact_info
end
