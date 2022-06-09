class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one_attached :video
  has_many :likes

  def liked?(user)
    self.likes.find { |like| like.user_id == user.id }
  end
end
