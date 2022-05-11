class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
      if book.save
    #詳細画面へリダイレクトし、フラッシュメッセージを表示
    redirect_to book_path(book.id), notice: 'Book was successfully updated'
      else
        render new_book
      end  
  end


  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  
  

  private
  #ストロングパラメータ
    def book_params
      params.require(:book).permit(:title,:body)
    end

end
