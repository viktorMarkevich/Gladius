class CreateNewsBulletins < ActiveRecord::Migration
  def change
    create_table :news_bulletins do |t|

      t.timestamps
    end
  end
end
