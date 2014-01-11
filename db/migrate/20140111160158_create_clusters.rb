class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :system_id

      t.timestamps
    end
  end
end
