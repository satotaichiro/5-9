class UsersController < ApplicationController

  before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
  	if params[:id].to_i == current_user.id
  	  @user = User.find(params[:id])
  	  render :edit
  	else
  		redirect_to user_path(current_user.id)
  	end
  end 

  def new
    @user = User.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = 'You have Update User successfully.'
      redirect_to user_path(@user.id)
    else
      # flash.now[:notice] = 'You have updated user successfully.'
      render :edit
    end

  end

   private
   
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def book_params
        params.require(:book).permit(:title, :body)
    end

    def correct_user
    	user = User.find(params[:id])
      if current_user != user
    	 redirect_to user_path(current_user)
      end
    end
end
