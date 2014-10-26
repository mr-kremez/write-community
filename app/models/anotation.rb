class Anotation < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :user
  has_one :book, through: :chapter

  delegate :name, :to => :chapter, :prefix => true
  delegate :name, :to => :book, :prefix => true
end
