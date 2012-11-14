class Skype < ActiveRecord::Base
  attr_accessible :body, :contact_info_id

  belongs_to :contact_info
end
