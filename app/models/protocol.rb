class Protocol < ActiveRecord::Base
  attr_accessible :string_protocol, :title

  belongs_to :duel

  has_many :string_protocols
end
