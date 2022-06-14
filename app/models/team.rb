class Team < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_one :chatroom_team
  after_create :create_chatroom

  def create_chatroom
    @chatroom_team = ChatroomTeam.create(name: self.title, team: self)
  end
end
