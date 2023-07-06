class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @all_book = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.save
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(user.id)
  end


  private

  def user_params
   params.require(:user).permit(:name,:image,:introduction,:title,:body)
  end

end
