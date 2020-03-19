class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def index
  	@users = User.all
  	@user = User.new
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
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to users_path(user.id)
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
    	 redirect_to root_path
      end
    end
end
