class CreateUserSchoolRelations < ActiveRecord::Migration
  def change
    create_table :user_school_relations do |t|
      t.string :name

      t.timestamps
    end
  end
end
