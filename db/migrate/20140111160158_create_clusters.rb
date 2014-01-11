class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name, null: false
      t.integer :system_id, null: false

      t.timestamps
    end
  end
end
