# frozen_string_literal: true

module ControlledAccess
  DEFAULT_TABLE_NAME = 'ca_permissions'.freeze
  ALLOWED_AUTHORIZATION_ADAPTERS = [:cancan, :cancancan, :pundit]
  
  module Controller
    module ACTION_NAMING
      READ = %w(index show)
      UPDATE = %w(edit update)
      CREATE = %w(new create)
      DESTROY = %w(destroy)
    end
  end
end