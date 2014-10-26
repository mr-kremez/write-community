class Book < ActiveRecord::Base
	ratyrate_rateable "rating"
	
	belongs_to :user
	belongs_to :category
	has_many :chapters, dependent: :destroy
	acts_as_taggable


  delegate :name, :to => :category, :prefix => true
  delegate :username, :to => :user, :prefix => true
	paginates_per 5
end
