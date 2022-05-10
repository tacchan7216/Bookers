class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    books = Book.new(books_params)
    books.save
    redirect_to 'new'
  end


  def index
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメータ
    def books_params
      params.permit(:title,:body)
    end
end
