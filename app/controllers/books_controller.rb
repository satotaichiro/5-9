class BooksController < ApplicationController
before_action :authenticate_user!
  def index
  	@books = Post.all
  	@book = Post.new
  end

  def show
  end

  def create
    @book = Post.new(book_params)
  if @book.save
    flash[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
  else
    @books = Post.all
    render action: :index
  end
end

  def edit
  end

  def top
  end

  private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
