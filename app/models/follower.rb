class Follower < ApplicationRecord
  belongs_to :users, optional: true
  validates_uniqueness_of :follower_id, scope: :following_id
end
