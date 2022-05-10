class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #詳細画面へリダイレクト
    redirect_to book_path(book.id)
  end


  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  #ストロングパラメータ
    def book_params
      params.require(:book).permit(:title,:body)
    end

end
