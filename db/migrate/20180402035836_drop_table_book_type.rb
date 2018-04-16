class DropTableBookType < ActiveRecord::Migration[5.1]
  def change
    drop_table :book_types
  end
end
