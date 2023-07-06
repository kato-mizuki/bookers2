class BooksController < ApplicationController

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    @new_book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@new_book.id)
  end

  def index
    @all_book = Book.all
    @book_new = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    book.save
    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:image)
  end
end
