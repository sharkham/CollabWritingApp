class User < ApplicationRecord
  has_many :memberships
  has_many :novels, through: :memberships
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 5..20, wrong_length: "Password must be between 5 and 20 characters." }

end
