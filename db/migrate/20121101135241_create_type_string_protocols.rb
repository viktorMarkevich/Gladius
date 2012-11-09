class CreateTypeStringProtocols < ActiveRecord::Migration
  def change
    create_table :type_string_protocols do |t|
      t.string :name

      t.timestamps
    end
  end
end
