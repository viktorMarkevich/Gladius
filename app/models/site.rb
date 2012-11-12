class Site < ActiveRecord::Base
  attr_accessible :body

  belongs_to :contact_info
end
