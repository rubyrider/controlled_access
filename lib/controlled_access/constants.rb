# frozen_string_literal: true

module ControlledAccess
  DEFAULT_TABLE_NAME = 'ca_permissions'.freeze
  ALLOWED_AUTHORIZATION_ADAPTERS = [:cancan, :pundit]
end