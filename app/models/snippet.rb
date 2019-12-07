class Snippet < ApplicationRecord
  belongs_to :novel

  validates :title, presence: true
end
