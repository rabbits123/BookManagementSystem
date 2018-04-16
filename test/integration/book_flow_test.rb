require 'test_helper'

class BookFlowTest < ActionDispatch::IntegrationTest

  user = User.find_by(email: "1991@gmail.com")
  $cookie = user.create_new_auth_token

  puts $cookie

  test "can create a new book" do
    request.headers = $cookie
    post "/api/v1/books",
         params: {book: {title: "New book", content: "This is content", author: "Mv argusta", isbn: "112-333-222", user_id: 1, type_id: 1}}
         assert_response :success
  end

end
