class BooksController < ApplicationController
  def index
    @books = Book.all
    # your code here
    render index: @books
  end

  def new
    # your code here
    @book = Book.new
    render :new
  end

  def create
    # your code here
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Created #{@book.title}"
      redirect_to :controller => 'books'
    else
      render :new
    end
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    book.destroy
    redirect_to :controller => 'books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
