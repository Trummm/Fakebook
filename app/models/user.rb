class User < ApplicationRecord
  before_save { self.email = email.downcase }  
  has_secure_password
  attr_accessor :skip_validations_create, :skip_validations_update

  VALID_EMAIL_REGEX = /[a-z0-9]+@gmail.com/
  VALID_NICKNAME_REGEX = /[@#][A-Za-z0-9]/
  VALID_PHONE_REGEX = /\d{3}\-\d{3}\-\d{4}/
  PASSWORD_MIN_LENGTH = 6
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  has_one_attached :background

  validates :name, presence: true,
                   length: { maximum: 30 }

  validates :nickname, presence: true,
                       uniqueness: true,
                       length: { maximum: 12 },
                       format: { with: VALID_NICKNAME_REGEX },
                       unless: :skip_validations_create

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 100 }

  validates :password, presence: true,
                       length: { minimum: PASSWORD_MIN_LENGTH },
                       allow_nil: true

  validates :phone, presence: true,
                    allow_nil: true

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
end
