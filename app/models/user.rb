class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_one_attached :image
  has_one_attached :background

  validates :email, presence: true
  validates :password, presence: true
end
