class CreateSkypes < ActiveRecord::Migration
  def change
    create_table :skypes do |t|
      t.string :name
      t.integer :contact_info_id

      t.timestamps
    end
  end
end
