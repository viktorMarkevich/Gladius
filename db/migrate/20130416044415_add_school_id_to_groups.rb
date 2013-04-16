class AddSchoolIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :school_id, :integer
  end
end
