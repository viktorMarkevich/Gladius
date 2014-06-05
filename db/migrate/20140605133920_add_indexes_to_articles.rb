class AddIndexesToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :title, :unique => true
    add_index :articles, :to_homepage, :unique => true
    add_index :articles, :published, :unique => true
    add_index :articles, :school_id, :unique => true
    add_index :articles, :author_id, :unique => true
  end
end
