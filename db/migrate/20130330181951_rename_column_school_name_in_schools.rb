class RenameColumnSchoolNameInSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :school_name, :name
  end
end
