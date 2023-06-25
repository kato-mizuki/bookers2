class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
     render 'new'
    end
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
   
  end
  
  def destroy
    book = Book.fin(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book)
  end
end
