class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :image
  has_one_attached :background

  validates :email, presence: true
  validates :password, presence: true

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
end
