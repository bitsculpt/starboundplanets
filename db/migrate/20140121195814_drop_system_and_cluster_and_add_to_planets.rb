class DropSystemAndClusterAndAddToPlanets < ActiveRecord::Migration

  def up
    drop_table :systems
    drop_table :clusters

    add_column :planets, :system, :string, null: false
    add_column :planets, :orbit, :string, null: false
    add_column :planets, :x_coord, :integer, null: false
    add_column :planets, :y_coord, :integer, null: false
    remove_column :planets, :cluster_id
  end

  def down
    create_table :systems do |t|
      t.string :name, null: false
      t.integer :x_coord, null: false
      t.integer :y_coord, null: false
      t.integer :sector_id, null: false

      t.timestamps
    end
    create_table :clusters do |t|
      t.string :name, null: false
      t.integer :system_id, null: false

      t.timestamps
    end

    remove_column :planets, :system
    remove_column :planets, :orbit
    remove_column :planets, :x_coord
    remove_column :planets, :y_coord
    add_column :planets, :cluster_id, :integer, null: false
  end

end
