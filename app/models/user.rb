class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_one_attached :image

  validates :email, presence: true
  validates :password, presence: true
end
