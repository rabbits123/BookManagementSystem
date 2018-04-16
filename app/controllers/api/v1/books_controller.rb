module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!, except: [:index, :show, :get_number_of_pages]
      def index
        books = Book.page(params[:page] || 1).per(12)
        render json:{data: books, current_page: books.current_page}
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end

      def create
        book = current_user.books.new(book_params)
        if book.save
          render json:book, status: :ok
        else
          render json: {error: true, status: :unprocessable_entity}
        end
      end

      def update
        book = Book.find(params[:id])
        if current_user.is_admin || current_user.id == book.user_id
          if book.update_attributes(book_params)
            render json: {error: false, status: :ok}
          else
            render json:{error: true, status: :unprocessable_entity}
          end
        end
      end

      def destroy
        book = Book.find(params[:id])
        if current_user.is_admin || current_user.id == book.user_id
          book.destroy
          render json: {status: :ok, message: "Delete successfully"}
        else
          render json: {status: :unprocessable_entity, message: "Cannot delete book"}
        end
      end

      def delete_all
        if current_user.is_admin
          ActiveRecord::Base.connection.execute("delete from books")
          render json: {message: "delete books successfully", status: :ok}
        else
          render json: {message: "Cannot delete books", status: :unprocessable_entity}
        end
      end

      def get_number_of_pages
        books = Book.page(params[:page] || 1).per(12)
        render json: books.total_pages
      end

      private
      def book_params
        params.permit(:title, :content, :author, :isbn, :user_id, :type_id, :book_image)
      end

    end
  end
end