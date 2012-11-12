class CreateSkypes < ActiveRecord::Migration
  def change
    create_table :skypes do |t|
      t.string :body
      t.integer :contact_info_id

      t.timestamps
    end
  end
end
