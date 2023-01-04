class Post < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil } 
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many :notifications, as: :notificationable
  has_many :likes, dependent: :destroy
  has_one_attached :image

  validates :image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
end

