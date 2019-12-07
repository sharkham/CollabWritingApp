class User < ApplicationRecord
  has_many :memberships
  has_many :novels, through: :memberships
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 5..20, wrong_length: "Password must be between 5 and 20 characters." }

  # def self.not_members(novel)
  #   # self.where()
  #   #looking for instances do not have a membership that contains this novel id.
  #   self.all.each do |user|
  #     array = []
  #     if !user.novels
  #       array << user
  #     elsif user.novels && !user.novels.include?(novel)
  #       array << user
  #     end
  #     # if user.novels && !user.novels.include?(novel)
  #     #   array << user
  #     # end
  #     array
  #   end
  # end

end
