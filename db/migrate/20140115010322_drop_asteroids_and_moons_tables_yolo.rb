class DropAsteroidsAndMoonsTablesYolo < ActiveRecord::Migration
  def up
    drop_table :asteroid_fields, :moons
  end
end
