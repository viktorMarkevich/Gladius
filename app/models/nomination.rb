class Nomination < ActiveRecord::Base

  belongs_to :tournament
  belongs_to :type_nomination
  belongs_to :params_nomination
  belongs_to :list_registration

  has_many :honors
  has_many :duels
end
