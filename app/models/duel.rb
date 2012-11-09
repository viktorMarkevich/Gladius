class Duel < ActiveRecord::Base
  attr_accessible :title

  belongs_to :fighter, :polymorphic => true, :foreign_key => :item_left
  belongs_to :fighter, :polymorphic => true, :foreign_key => :item_right
  belongs_to :type_part
  belongs_to :nomination

  has_one :protocol
end
