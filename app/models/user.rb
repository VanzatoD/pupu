class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :posts

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  acts_as_mentioner
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
