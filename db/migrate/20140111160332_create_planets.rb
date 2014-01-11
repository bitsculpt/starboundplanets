class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :biome,         null:false
      t.integer :threat_level, null:false
      t.integer :cluster_id, null:false
      t.text :description
      t.string :username

      t.timestamps
    end
  end
end
