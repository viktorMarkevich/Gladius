class AddCreatorIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :creator_id, :integer
  end
end
