class AddFightingArtIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :fighting_art_id, :integer
  end
end
