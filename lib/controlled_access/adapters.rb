# frozen_string_literal: true

module ControlledAccess
  module Adapters
    autoload :Pundit, "pundit" if ControlledAccess.pundit?
    autoload :Cancan, "cancan" if ControlledAccess.cancan?
  end
end
