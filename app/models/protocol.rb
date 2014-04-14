class Protocol < ActiveRecord::Base

  belongs_to :duel

  has_many :string_protocols
end
