class Anotation < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :user
end
