class RenameTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :types, :type, :typeofbook
  end
end
