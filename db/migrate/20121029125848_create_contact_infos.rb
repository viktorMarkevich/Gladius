class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.integer :info_for_id
      t.string :info_for_type

      t.timestamps
    end
  end
end
