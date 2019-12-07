class Novel < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :snippets

  accepts_nested_attributes_for :memberships



end
