class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

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
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = 'You have updated user successfully.'
      @user = User.find(params[:id])
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
   params.require(:user).permit(:name,:image,:introduction,:title,:body)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user.id)
    end
  end

end
