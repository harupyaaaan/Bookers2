class UsersController < ApplicationController


  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = Book.where(user_id: params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
     redirect_to user_path(current_user)
    end
  end

  def new
   @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
     @users = User.all
     render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
