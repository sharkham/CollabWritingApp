class Novel < ApplicationRecord
  has_many :memberships, :dependent => :delete_all
  has_many :users, through: :memberships

  has_many :snippets, :dependent => :delete_all

  accepts_nested_attributes_for :memberships

  validates :title, presence: true

end
