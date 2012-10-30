class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.integer :contact_info_id

      t.timestamps
    end
  end
end
