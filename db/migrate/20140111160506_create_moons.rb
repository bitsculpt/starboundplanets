class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.string :name, null:false
      t.integer :cluster_id, null:false
      t.string :biome, null:false
      t.integer :threat_level, null:false
      t.string :username
      t.text :description

      t.timestamps
    end
  end
end
