class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.references :info_for, :polymorphic => true
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
