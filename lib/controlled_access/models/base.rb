# frozen_string_literal: true
#
#
require 'active_support/concern'

module ControlledAccess
  module Models
    module Base
      module Scope
        extend ActiveSupport::Concern
        
        included do
          scope :permission_for, -> { where() }
          scope :for_resources, -> {  }
        end
      end
    end
  end
end