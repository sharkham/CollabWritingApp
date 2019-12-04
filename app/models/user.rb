class User < ApplicationRecord
  has_many :memberships
  has_many :novels, through: :memberships
end
