class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6 }
  validates :full_name, presence: true, length: { minimum: 8 }
  validates :password, presence: true, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, authentication_keys: [:username]
end
