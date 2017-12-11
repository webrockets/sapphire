class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def destroy?
    user.admin? and record.id != 1
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin? or user.id == record.id
  end

  def change_role?
    user.admin? and record.id != 1 # cant change super admin role
  end
end
