class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_chapter, only: [:show, :edit, :update]
  before_action :set_book

  def index
    @chapters = @book.chapters
    @chapter = @chapters.first
    respond_with(@chapter)
  end

  def show
    respond_with(@chapter)
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
