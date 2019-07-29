# frozen_string_literal: true

module ControlledAccess
  module Controllers
    module Helpers
      def set_name(controller_action_name)
        @controller_action_name = controller_action_name
      end
      
      def name_finder(controller_action_name)
        controller_action_name
      end
    end
  end
end