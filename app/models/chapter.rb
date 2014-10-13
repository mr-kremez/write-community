class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :anotations, dependent: :destroy
end
