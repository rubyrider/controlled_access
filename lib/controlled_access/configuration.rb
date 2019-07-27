require_relative "constants"

module ControlledAccess
  module Configuration
    mattr_accessor :enabled, default: true
    mattr_accessor :auto_authorisation, default: false
    mattr_accessor :permission_table, default: DEFAULT_TABLE_NAME
    mattr_accessor :permission_model, default: -> { ControlledAccess::Permission }
    mattr_accessor :authorization_adapter, default: :pundit
  
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
      authorization_adapter
    end
    
    def self.cancan?
      adapter == :cancan
    end
    
    def self.pundit?
      adapter == :pundit
    end
  end
end