class BooksController < ApplicationController
  def new
    　@book = Book.new
  end 

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
         flash[:notice] = "You have created book successfully."
         redirect_to book_path(@book.id)
      else
        @user = User.find(params[:id])
        @books = @user.books.page(params[:page]).reverse_order
        render template: 'users/show'
      end
  end

  def edit
    @book = Book.find(params[:id])
  end 
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  end

  def index
      @books = Book.page(params[:page]).reverse_order
  end

  def show
      @book = Book.find(params[:id])
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
