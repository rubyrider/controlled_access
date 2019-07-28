require 'rails_helper'

describe ControlledAccess do
  context 'With valid adapter' do
    subject {ControlledAccess}
  end

  describe '.authorization_adapter' do
    it 'should return default value' do
      expect(ControlledAccess.authorization_adapter).to be == :pundit
    end
  
    it 'should accept new value' do
      ControlledAccess.authorization_adapter = :cancan
    
      expect(ControlledAccess.authorization_adapter).to be == :cancan
    end
  end

  describe '.auto_authorisation' do
    it 'should return default value' do
      expect(ControlledAccess.auto_authorisation).to be_falsey
    end
  
    it 'should accept new value' do
      ControlledAccess.auto_authorisation = :cancan
    
      expect(ControlledAccess.auto_authorisation).to be == :cancan
    end
  end

  describe '.enabled?' do
    it 'should return if enable' do
      expect(described_class.enabled?).to be_truthy
    end
  end
  
  describe '.permission_klass' do
    it 'should return default permission klass' do
      expect(described_class.permission_klass).to be == ControlledAccess::Permission
    end
  end

  describe '.setup' do
    class FakePermission
    end
  
    before do
      described_class.setup do |configuration|
        configuration.enabled = false
        configuration.permission_table = 'permissions'
        configuration.permission_model = -> { FakePermission }
        configuration.auto_authorisation = true
        configuration.authorization_adapter = :cancan
      end
    end
  
    it 'should take parameters in block' do
      expect(described_class.authorization_adapter).not_to be == :rolify
      expect(described_class.authorization_adapter).to be == :cancan
      expect(described_class.enabled).to be_falsey
      expect(described_class.auto_authorisation).to be_truthy
    end
  end
end