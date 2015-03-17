class PersonsController < ApplicationController
	before_action :authenticate_user!
  	def profile
  		@books = Book.where(:user_id => current_user.id).page(params[:page]).per(params[:per])
  		@anotations = User.find(current_user).anotations
  	end
end
