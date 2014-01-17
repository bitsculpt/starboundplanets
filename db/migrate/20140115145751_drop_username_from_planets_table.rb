class DropUsernameFromPlanetsTable < ActiveRecord::Migration
  def up
    remove_column :planets, :username
  end

  def down
    add_column :planets, :username, :string
  end

end
