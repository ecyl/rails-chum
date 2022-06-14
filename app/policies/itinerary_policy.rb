class ItineraryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      @scope.where(user: @user)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
