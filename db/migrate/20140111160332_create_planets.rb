class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :biome
      t.integer :threat_level
      t.integer :cluster_id
      t.text :description
      t.string :username

      t.timestamps
    end
  end
end
