# frozen_string_literal: true

class ControlledAccess::DefaultPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
