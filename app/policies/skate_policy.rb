class SkatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

<<<<<<< HEAD
=======
  def edit?
    # user es igual a current user y ve si el usuario de la secion es el mismo para poder editar
    user == record.user
  end

  def update?
    user == record.user
  end

>>>>>>> 96b5856af546e785ecc57c276244abc06287cf59
  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    return true
  end
end
