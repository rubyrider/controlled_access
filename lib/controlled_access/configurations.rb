# frozen_string_literal: true

require "active_support/concern"

module ControlledAccess
  autoload :DEFAULT_TABLE_NAME, "controlled_access/constants"
  autoload :ALLOWED_AUTHORIZATION_ADAPTERS, "controlled_access/constants"

  module Configurations
    extend ActiveSupport::Concern

    included do
      cattr_accessor :enabled, default: true
      cattr_accessor :auto_authorisation, default: false
      cattr_accessor :permission_table, default: DEFAULT_TABLE_NAME
      cattr_accessor :permission_model, default: -> { ControlledAccess::Permission }
      cattr_accessor :user_model, default: -> { User }
      cattr_accessor :role_model, default: -> { Role }
      cattr_accessor :authorization_adapter, default: :cancan
      cattr_accessor :owner, default: :user
      cattr_accessor :current_user_method, default: :current_user

      def self.setup
        yield(self)
      end

      def self.permission_klass
        permission_model.()
      end

      def self.enabled?
        enabled
      end

      def self.adapter
        self.authorization_adapter
      end

      def self.cancan?
        adapter == (:cancan || :cancancan)
      end

      def self.pundit?
        adapter == :pundit
      end

      def self.valid_adapter?
        adapter.in?(ControlledAccess::ALLOWED_AUTHORIZATION_ADAPTERS)
      end
    end
  end
end
