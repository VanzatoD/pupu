class ChatroomTeamPolicy < ApplicationPolicy

  def show?
    return true
  end

  def create?
    return true
  end
end
