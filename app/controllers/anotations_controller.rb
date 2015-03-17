class AnotationsController < ApplicationController
	before_action :set_chapter
	before_action :set_book
	before_action :authenticate_user!

	def create
		puts params
		@anotation = @chapter.anotations.create(anotation_params)
		respond_to do |format|
        format.html { redirect_to book_chapter_path(@book, @chapter), notice: 'Anotation was successfully created.' }
        format.js
    end
	end

	def destroy
		@anotation = @chapter.anotations.find(params[:id])
		@anotation.destroy
		respond_to do |format|
			format.html { redirect_to book_chapter_path(@book, @chapter) }
			format.json { head :no_content }
		end
	end

	private
		def anotation_params
			params.require(:anotation).permit(:body, :user_id)
		end

		def set_chapter
			@chapter = Chapter.find(params[:chapter_id])
		end

		def set_book
			@book = Book.find(params[:book_id])
		end
end
