class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    user_is_chatroom_participant?
  end

  def new?
    return true
  end

  def create?
    return true
  end

  private

  def user_is_chatroom_participant?
    record.users.where(id: user.id).present?
  end
end
