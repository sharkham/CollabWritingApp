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

  def self.not_members(novel_id)
    self.find_by_sql(["SELECT users.id, users.username, users.email, users.password_digest, users.created_at, users.updated_at FROM users
    LEFT OUTER JOIN memberships ON users.id = memberships.user_id
      AND memberships.novel_id = ?
    LEFT OUTER JOIN novels ON novels.id = memberships.novel_id
    WHERE novels.id IS NULL", novel_id])
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end
