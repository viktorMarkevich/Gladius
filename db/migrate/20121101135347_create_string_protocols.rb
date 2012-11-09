class CreateStringProtocols < ActiveRecord::Migration
  def change
    create_table :string_protocols do |t|
      t.string :title
      t.float :value
      t.integer :type_string_protocol_id
      t.integer :protocol_id

      t.timestamps
    end
  end
end
