class AddSectorIdToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :sector_id, :integer
  end
end
