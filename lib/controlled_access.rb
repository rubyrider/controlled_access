# frozen_string_literal: true

require "controlled_access/engine"


module ControlledAccess
  autoload :Configurations, "controlled_access/configurations"

  include Configurations

  autoload :Adapters, "controlled_access/adapters" if autoload?(:Configurations)
end
