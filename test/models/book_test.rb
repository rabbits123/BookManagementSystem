require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "test book title" do
    book = Book.new
    book.title = "This is spatar"
    assert book.save, "Book must have title"
  end

  test "test book delete" do
    book = Book.first
    assert book.delete, "Book delete successfully"
  end

  test "test book update" do
    book = Book.first

  end

end
