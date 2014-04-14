class Honor < ActiveRecord::Base

  belongs_to :item, :polymorphic => true
  belongs_to :nomination
end
