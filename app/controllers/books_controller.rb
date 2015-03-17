class BooksController < ApplicationController
  respond_to :html, :xml, :json
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:index]
  before_action :check_book_belongs_to_user, only: [:edit, :create, :destroy, :update]

  def index
    if params[:category_id]
      @category_id = params[:category_id].to_i
      @books = Book.where(category_id: params[:category_id]).page(params[:page]).per(params[:per])
    elsif params[:tag]
      @books = Book.tagged_with(params[:tag]).page(params[:page]).per(params[:per])
    elsif params[:search]
      @books = Book.where("name like ? or description like ?","%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(params[:per])
    else
      @books = Book.page(params[:page]).per(params[:per])
    end
    respond_with(@books)
  end

  def show
    @chapter = Book.find(params[:id]).chapters.first
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
    redirect_to user_root_path, notice: "Book successfully deleted!"
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :description, :category_id, :tag_list)
    end

    def set_tags
      @tags = Book.tag_counts.map {|tag| {text: tag.name, weight: tag.taggings_count, link:  Rails.application.routes.url_helpers.books_path(:tag => tag.name)} }.to_json
    end

    def check_book_belongs_to_user
      redirect_to book_path(@book), alert: "You can not edit someone else's book " if @book.user_id != current_user.id
    end
end
