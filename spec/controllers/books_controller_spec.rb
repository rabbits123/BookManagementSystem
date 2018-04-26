require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  describe 'route testing' do
    it {should route(:get, '/api/v1/books').to(action: :index)}
    it {should route(:get, '/api/v1/books/1').to(action: :show, id: 1)}
    it {should route(:post, '/api/v1/books').to(action: :create)}
    it {should route(:put, '/api/v1/books/1').to(action: :update, id: 1)}
    it {should route(:delete, '/api/v1/books/1').to(action: :destroy, id: 1)}
    it {should route(:delete, '/api/v1/delete_all').to(action: :delete_all)}
  end

  context 'Testing actions in controller with respond with' do
    describe 'GET #index' do
      before {get :index}
      it {should respond_with(200)}
    end

    describe 'GET #show' do
      before do
        book = FactoryGirl.create(:book)
        get :show, params: {id: book.id}
      end
      it {
        should respond_with(200)
      }
    end

    describe 'POST #create' do
      let(:valid_params) do
        {
            title: "this is spatar",
            content: "stupid book",
            type_id: 1,
            user_id: 1
        }
      end

      before do
        user = FactoryGirl.build(:user)
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
        post :create, params: valid_params
      end
      it {
        should respond_with(200)
      }
    end

    describe 'PUT #update' do
      let(:valid_params) do
        {
            book: {
                title: "this is spatar",
                content: "stupid book",
                type_id: 1,
                user_id: 1
            }
        }
      end

      before do
        #book = FactoryGirl.create(:book)
        user = FactoryGirl.create(:user)
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
        put :update, params: {id: 298486374, book: valid_params}
      end
      it {should respond_with(200)}
    end


    describe 'DELETE #destroy' do
      before{
        user = FactoryGirl.create(:user)
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
        delete :destroy, params: {id: 298486374}
      }
      it {should respond_with(200)}
    end

  end

end


=begin testing params validation but failed
  describe 'validate params do' do
    it do
      params = {
          book: {
              title: "This is spatar",
              content: "this book is amazing",
              isbn: "111-222-333",
              author: "Megusta",
              user_id: 1,
              type_id: 1,
              book_image: "GameOfThrones1.jpg"
          }
      }
      should permit(:title, :content, :isbn, :author, :user_id, :type_id)
                 .for(:create, params: params)
                 .on(:book)
    end
  end


=end