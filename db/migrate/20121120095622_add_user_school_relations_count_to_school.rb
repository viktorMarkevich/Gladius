class AddUserSchoolRelationsCountToSchool < ActiveRecord::Migration
  def up
    add_column :schools, :user_school_relations_count, :integer, :default => 0

    School.all.each do |s|
      School.update_counters s.id, :user_school_relations_count => s.user_school_relations.count
    end
  end

  def down
    remove_column :schools, :user_school_relations_count
  end
end
