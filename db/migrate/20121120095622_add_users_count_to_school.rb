class AddUsersCountToSchool < ActiveRecord::Migration
  def up
    add_column :schools, :users_count, :integer, :default => 0

    School.all.each do |s|
      School.update_counters s.id, :users_count => s.users.count
    end
  end

  def down
    remove_column :users, :users_count
  end
end
