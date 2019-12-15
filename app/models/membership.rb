class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :novel

  validates :role, presence: :true

end
