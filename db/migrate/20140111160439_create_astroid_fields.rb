class CreateAstroidFields < ActiveRecord::Migration
  def change
    create_table :astroid_fields do |t|
      t.string :name, null:false
      t.integer :cluster_id, null:false
      t.integer :threat_level, null:false
      t.text :description
      t.string :username

      t.timestamps
    end
  end
end
