class AddBookImageToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :book_image, :string
  end
end
