class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope.all
      scope.where(user: user)
    end
  end

    def create?
      true
    end

    def show?
      record.user == user
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end

    def recap?
      show?
    end
end
