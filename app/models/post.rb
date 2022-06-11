class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  has_one_attached :video
  has_many :likes, dependent: :destroy

  def liked?(user)
    self.likes.find { |like| like.user_id == user.id }
  end
end
