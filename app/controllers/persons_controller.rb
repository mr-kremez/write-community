class PersonsController < ApplicationController
	#before_action :authenticate_member!
	require 'book'
  	def profile
  		@books = Book.where(:user_id => current_user.id).page(params[:page]).per(params[:per])
  	end
end
