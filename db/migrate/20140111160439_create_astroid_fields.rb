class CreateAstroidFields < ActiveRecord::Migration
  def change
    create_table :astroid_fields do |t|
      t.string :name
      t.integer :cluster_id
      t.integer :threat_level
      t.text :description
      t.string :username

      t.timestamps
    end
  end
end
