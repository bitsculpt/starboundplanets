class DropUsernameFromPlanetsTable < ActiveRecord::Migration
  def up
    remove_column :planets, :username
  end
  
end
