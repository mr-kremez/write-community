class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_chapter, only: :show
  before_action :set_book

  def index
    @chapters = @book.chapters
    respond_with(@chapter)
  end

  def show
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
      params.require(:chapter).permit(:name)
    end
end
