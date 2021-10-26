class SkatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def edit?
    # user es igual a current user y ve si el usuario de la secion es el mismo para poder editar
    user == record.user
  end

  def update?
    user == record.user
  end

  def new?
    return true
  end

  def create?
    return true
  end
end
