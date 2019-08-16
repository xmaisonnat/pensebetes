class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def accept?
    record.animal.user == user
  end

  def decline?
    record.animal.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def create?
    record.user == user
  end

  def index?
    record.user == user
  end
end
