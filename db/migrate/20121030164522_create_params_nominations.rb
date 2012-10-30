class CreateParamsNominations < ActiveRecord::Migration
  def change
    create_table :params_nominations do |t|
      t.string :sex
      t.float :min_weight
      t.float :max_weight
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
