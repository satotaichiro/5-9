class BooksController < ApplicationController
before_action :authenticate_user!
  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :index
  end
end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def top
  end

def update
    book = Book.find(params[:id])
  if book.update(book_params)
    flash[:update] = 'You have updated book succcessfully.'
    redirect_to book_path(book), notice: 'Book was successfully created.'
  else
    render action: :index
  end
end

  private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
