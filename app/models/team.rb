class Team < ApplicationRecord
  belongs_to :user
  has_many :memberships
end
