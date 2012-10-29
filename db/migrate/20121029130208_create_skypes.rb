class CreateSkypes < ActiveRecord::Migration
  def change
    create_table :skypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
