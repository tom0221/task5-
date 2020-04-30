class BooksController < ApplicationController
	before_action :authenticate_user!#ログインしてなければ、見れないようにする。

  def new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	  flash[:notice] = "successfully"
  	redirect_to book_path(@book)
    else
    	flash[:alert] = "error"
    	@books = Book.all
    	render :index
    end
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
    @user_book = Book.find(params[:id])
    @user = @user_book.user
  	@book = Book.new#画像投稿の画面を表示するアクションメソッド
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
      if @book.user_id != current_user.id
        redirect_to books_path
      end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	 flash[:notice] = "successfully"
  	redirect_to book_path(@book)
    else
  	flash.now[:alert] = 'error'
  	render :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end