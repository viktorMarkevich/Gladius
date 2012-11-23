class AddNameToAdminUser < ActiveRecord::Migration
  def up
    add_column :admin_users, :name, :string, :default => "admin"
  end

  def down
    remove_column :admin_users, :name
  end
end
