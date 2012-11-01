class StringProtocol < ActiveRecord::Base
  attr_accessible :title, :value

  belongs_to :type_string_protocol
  belongs_to :protocol
end
