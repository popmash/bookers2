class UsersController < ApplicationController
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @book_new = Book.new
  end
  
  def create
    @user = User.new(user_params)
    @book.save
    redirect_to user_path(@user.id)
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)
  end
 
end

