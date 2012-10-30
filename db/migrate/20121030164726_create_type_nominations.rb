class CreateTypeNominations < ActiveRecord::Migration
  def change
    create_table :type_nominations do |t|
      t.string :name

      t.timestamps
    end
  end
end
