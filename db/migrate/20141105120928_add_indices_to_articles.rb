class AddIndicesToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :admin_author_id, :unique => true
    add_index :articles, :author_id, :unique => true
    add_index :articles, :school_id, :unique => true
  end
end
