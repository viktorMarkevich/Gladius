class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.datetime :date_of_foundation
      t.string :status
      t.text :info

      t.timestamps
    end
  end
end
