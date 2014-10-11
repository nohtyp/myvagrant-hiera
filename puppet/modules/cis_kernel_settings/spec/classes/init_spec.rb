require 'spec_helper'
describe 'cis_kernel_settings' do

  context 'with defaults for all parameters' do
    it { should contain_class('cis_kernel_settings') }
  end
end
