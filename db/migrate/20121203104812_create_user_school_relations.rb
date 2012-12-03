class CreateUserSchoolRelations < ActiveRecord::Migration
  def change
    create_table :user_school_relations do |t|
      t.integer :user_id
      t.integer :school_id

      t.timestamps
    end
  end
end
