class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	paginates_per 5
end
