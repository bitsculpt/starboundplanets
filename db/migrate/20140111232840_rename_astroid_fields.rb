class RenameAstroidFields < ActiveRecord::Migration
  def up
    rename_table :astroid_fields, :asteroid_fields
  end

  def down
    rename_table :asteroid_fields, :astroid_fields
  end
end
