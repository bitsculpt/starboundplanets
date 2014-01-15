class AddUserIdAndNameToPlanetsTable < ActiveRecord::Migration
  def up
    add_column :planets, :user_id, :integer
    add_column :planets, :name, :string
  end

  def down
  remove_column :planets, :user_id
  remove_column :planets, :name
  end

end
