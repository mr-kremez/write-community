class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :chapters, dependent: :destroy

	paginates_per 5
end
