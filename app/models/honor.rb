class Honor < ActiveRecord::Base
  attr_accessible :item_id, :item_type, :name, :nomination_id

  belongs_to :item, :polymorphic => true
  belongs_to :nomination
end
