require 'rails_helper'

describe ControlledAccess do
  subject {ControlledAccess}
  
  it { is_expected.to respond_to :permission_table }
  it { is_expected.to respond_to :permission_ }
end