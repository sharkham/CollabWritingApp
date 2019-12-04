class User < ApplicationRecord
  has_many :memberships
  has_many :novels, through: :memberships
  has_secure_password
end
