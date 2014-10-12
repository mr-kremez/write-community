class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_chapter, only: [:show, :edit, :update]
  before_action :set_book

  def index
    respond_with(@chapter)
  end

  def show
    @anotations = @chapter.anotations.where(:user_id => current_user)
    
    @chapter_id = params[:id].to_i
    @first_chapter_id_of_the_book = @book.chapters.pluck(:id).first
    @last_chapter_id_of_the_book  = @book.chapters.pluck(:id).last
    @prev_chapter ,@next_chapter  = @chapter.set_prev_next_chapters(@first_chapter_id_of_the_book, @last_chapter_id_of_the_book)
    respond_with(@chapter)
  end

  def new
    @chapter = Chapter.new
    respond_with(@chapter)
  end

  def create
    @chapter = @book.chapters.create(chapter_params)
    redirect_to book_chapter_path(@book, @chapter)
  end

  def update
    respond_to do |format|
      if @chapter.update_attributes(chapter_params)
        format.html { redirect_to book_chapter_path(@book, @chapter), notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
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

    def set_prev_next_chapters(first_chapter_id, last_chapter_id)
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
    end
end
