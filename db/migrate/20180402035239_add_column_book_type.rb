class AddColumnBookType < ActiveRecord::Migration[5.1]
  def change
    add_column :book_types, :type, :string
  end
end
