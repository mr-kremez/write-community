class BooksController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    #@books = Book.all
    @books = Book.page(params[:page]).per(params[:per])
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :description, :category_id)
    end
end
