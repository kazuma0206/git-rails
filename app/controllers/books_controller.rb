class BooksController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book=Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end


  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render:edit
    end
  end

def destroy
  book=Book.find(params[:id])
  book.destroy
  #メッセージを入れたい時に入れる
  flash[:notice] = "Book was successfully destroyed."
  redirect_to books_path
end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end



end