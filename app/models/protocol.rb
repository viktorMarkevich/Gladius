class Protocol < ActiveRecord::Base
  attr_accessible :string_protocol, :title

  has_many :string_protocols
  belongs_to :duel
end
