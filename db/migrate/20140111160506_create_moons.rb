class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.string :name
      t.integer :cluster_id
      t.string :biome
      t.integer :threat_level
      t.string :username
      t.text :description

      t.timestamps
    end
  end
end
