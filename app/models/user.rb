class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :posts
  has_many :followers, foreign_key: "followed_id", class_name: "Follow"
  has_many :following, foreign_key: "follower_id", class_name: "Follow"
  has_many :comments
  acts_as_taggable_on :tags

  TAGS = ['League of Legends', 'Counter Strike', 'Tekken 7']


  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
