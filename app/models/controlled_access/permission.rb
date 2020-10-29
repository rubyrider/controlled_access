# frozen_string_literal: true

module ControlledAccess
  class Permission < ApplicationRecord
    self.table_name = ControlledAccess.permission_table
  end
end
