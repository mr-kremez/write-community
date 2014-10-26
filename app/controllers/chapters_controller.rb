class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :check_chapter_belongs_to_user, only: [:edit, :create, :destroy, :update]

  def index
    respond_with(@chapter)
  end

  def show
    @anotations = @chapter.anotations.where(:user_id => current_user)
    
    @chapters = @book.chapters

    @chapter_id = params[:id].to_i
    @first_chapter_id_of_the_book = @book.chapters.pluck(:id).first
    @last_chapter_id_of_the_book  = @book.chapters.pluck(:id).last

    chapter_index = @chapters.index(@chapter)
    (chapter_index < @chapters.length - 1) ? @next_chapter = @chapters.at(chapter_index + 1) : @next_chapter = @chapter
    (chapter_index > 0) ? @prev_chapter = @chapters.at(chapter_index - 1) : @prev_chapter = @chapter
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

  def destroy
    @chapter.destroy
    redirect_to book_path(@book), notice: "Chapter successfully deleted!"
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

    def check_chapter_belongs_to_user
      redirect_to book_chapter_path(@book, @chapter), alert: "You can not edit someone else's book " if @book.user_id != current_user.id
    end
end
