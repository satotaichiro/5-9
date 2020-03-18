class UsersController < ApplicationController
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
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to users_path(user.id)
  end

   private
   
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image_id)
    end

        def book_params
        params.require(:book).permit(:title, :body)
    end
end
