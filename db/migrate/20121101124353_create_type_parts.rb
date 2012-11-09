class CreateTypeParts < ActiveRecord::Migration
  def change
    create_table :type_parts do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
