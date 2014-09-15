class AddColumnAdminAuthorIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :admin_author_id, :integer
  end
end
