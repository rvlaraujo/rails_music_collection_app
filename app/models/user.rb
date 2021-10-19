class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6 }
  validates :full_name, presence: true, length: { minimum: 8 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable
end
