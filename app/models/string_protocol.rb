class StringProtocol < ActiveRecord::Base

  belongs_to :type_string_protocol
  belongs_to :protocol
end
