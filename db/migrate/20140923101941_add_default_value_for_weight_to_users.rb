class AddDefaultValueForWeightToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :weight
    add_column :users, :weight, :float, default: 0.0
  end
end
