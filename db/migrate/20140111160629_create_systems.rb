class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name, null: false
      t.integer :x_coord, null: false
      t.integer :y_coord, null: false
      t.integer :sector_id, null: false

      t.timestamps
    end
  end
end
