class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.integer :x_coord
      t.integer :y_coord
      t.integer :sector_id

      t.timestamps
    end
  end
end
