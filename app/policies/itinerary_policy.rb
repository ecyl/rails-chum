class ItineraryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      # @scope.where(user: @user)
      @scope.all
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

  def accepted?
    @record.accepted?(@user)
  end

  def mytrips?
    true
  end
end
