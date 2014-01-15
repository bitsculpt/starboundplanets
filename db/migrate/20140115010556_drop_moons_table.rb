class DropMoonsTable < ActiveRecord::Migration
  def up
    drop_table :moons
  end
end
