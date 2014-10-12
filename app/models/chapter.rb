class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :anotations, dependent: :destroy

  def set_prev_next_chapters(first_chapter_id, last_chapter_id)
    if id < last_chapter_id
      next_chapter = Chapter.find(id + 1)
    else
      next_chapter = self
    end
    if id > first_chapter_id
      prev_chapter = Chapter.find(id - 1)
    else
      prev_chapter = self
    end

    [prev_chapter, next_chapter]
  end
end
