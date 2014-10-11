class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_chapter, only: [:show, :edit, :update]
  before_action :set_book

  def index
    respond_with(@chapter)
  end

  def show
    @chapter_id = params[:id].to_i
    @first_chapter_id_of_the_book = @book.chapters.select(:id).first[:id].to_i
    @last_chapter_id_of_the_book = @book.chapters.select(:id).last[:id].to_i
    if @chapter_id < @last_chapter_id_of_the_book
      next_chapter = @chapter_id + 1
    else
      next_chapter = @chapter_id
    end
    if @chapter_id > @first_chapter_id_of_the_book
      prev_chapter = @chapter_id - 1
    else
      prev_chapter = @chapter_id
    end

    @prev_chapter = Chapter.find(prev_chapter)
    @next_chapter = Chapter.find(next_chapter)
    respond_with(@chapter)
  end

  def new
    @chapter = Chapter.new
    respond_with(@chapter)
  end

  def create
    @chapter = @book.chapters.create(chapter_params)
    redirect_to book_path(@book)
  end

  def update
    respond_to do |format|
      if @chapter.update_attributes(chapter_params)
        format.html { redirect_to @book, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_with(@chapter)
  end

  private
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def chapter_params
      params.require(:chapter).permit(:name, :content)
    end
end
