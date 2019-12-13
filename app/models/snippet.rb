class Snippet < ApplicationRecord
  belongs_to :novel

  validates :title, presence: true
  has_rich_text :content

  def self.grab_tag(tag, novel_id)
    self.where(tag: tag, novel_id: novel_id)
  end
end
