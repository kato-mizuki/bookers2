class BooksController < ApplicationController
   before_action :correct_user, only: [:edit, :update]

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @all_book = Book.all
      @user = current_user
      render :index
    end
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
    @user = current_user
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @user.id == current_user.id
     redirect_to book_path(@book.id)
    end
  end

end
