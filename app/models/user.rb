class User < ApplicationRecord
  has_many :reviews

  has_many :streamer_users
    has_many :streamers, through: :streamer_users
  has_many :clips

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def self.create_by_github_omniauth(auth)
     self.find_or_create_by(username: auth[:info][:email]) do |u|
       u.email = auth[:info][:email]
       u.password = SecureRandom.hex

     end
   end
end
