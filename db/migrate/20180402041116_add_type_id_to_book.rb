class AddTypeIdToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :type_id, :integer
  end
end
