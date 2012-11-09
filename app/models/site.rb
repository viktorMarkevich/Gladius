class Site < ActiveRecord::Base
  attr_accessible :name

  belongs_to :contact_info
end
