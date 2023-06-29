class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end


  private

  def user_params
   params.require(:user).permit(:name, :image, :introduction)
  end

end
