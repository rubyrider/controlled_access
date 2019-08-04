module ControlledAccess
  
  class RulesMapper
    def initialize(controller, action, subject_user, global = false)
      @controller   = controller
      @action       = action
      @subject_user = subject_user
      @global       = global
      @permissions  = ControlledAccess
                          .permission_model
                          .permission_for(subject_user)
                          .for_resources(controller, action)
    end
  end
end