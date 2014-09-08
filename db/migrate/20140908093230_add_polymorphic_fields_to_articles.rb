class AddPolymorphicFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :articlable_type, :string
    add_column :articles, :articlable_id, :integer

    add_index :articles, :articlable_id
  end
end
