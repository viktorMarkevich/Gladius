class Nomination < ActiveRecord::Base
  attr_accessible :params_nomination_id, :tournament_id, :type_nomination_id

  belongs_to :tournament
  belongs_to :type_nomination
  belongs_to :params_nomination
end
