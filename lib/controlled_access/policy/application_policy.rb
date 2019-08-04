module ControlledAccess
  module Policy
    class ControllerPolicy < Struct.new(:subject, :permission, :controller)
      def initialize(subject, controller)
        @subject    = subject
        @controller = controller
        @params     = controller.params
      end
    end
  end
end