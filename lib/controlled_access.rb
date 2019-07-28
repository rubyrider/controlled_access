# frozen_string_literal: true

require "controlled_access/engine"


module ControlledAccess
  autoload :Controllers, "controlled_access/controllers"
  autoload :Models, "controlled_access/models"
  autoload :DEFAULT_TABLE_NAME, "controlled_access/constants"
  
  cattr_accessor :enabled, default: true
  cattr_accessor :auto_authorisation, default: false
  cattr_accessor :permission_table, default: DEFAULT_TABLE_NAME
  cattr_accessor :permission_model, default: -> {ControlledAccess::Permission}
  cattr_accessor :authorization_adapter, default: :pundit
  
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
    adapter == :cancan
  end
  
  def self.pundit?
    adapter == :pundit
  end
  
  def self.valid_adapter?
    adapter.in?(ControlledAccess::ALLOWED_AUTHORIZATION_ADAPTERS)
  end
  
  
  autoload :Cancan, "controlled_access/cancan" if ControlledAccess.cancan?
  autoload :Pundit, "controlled_access/pundit" if ControlledAccess.pundit?
end