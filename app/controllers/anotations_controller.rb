class AnotationsController < ApplicationController
	before_action :set_chapter
	before_action :set_book
	before_action :authenticate_user!

	def create
		@anotation = @chapter.anotations.create(anotation_params)
		redirect_to book_chapter_path(@book, @chapter)
	end

	def destroy
		@anotation = @chapter.anotations.find(params[:id])
		@anotation.destroy
		redirect_to book_chapter_path(@book, @chapter)
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
