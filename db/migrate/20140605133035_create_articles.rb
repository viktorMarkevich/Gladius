class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :school_id
      t.integer :author_id
      t.boolean :published, default: false
      t.boolean :to_homepage, default: false

      t.timestamps
    end
  end
end
