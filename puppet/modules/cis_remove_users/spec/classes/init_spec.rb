require 'spec_helper'
describe 'cis_remove_users' do

  context 'with defaults for all parameters' do
    it { should contain_class('cis_remove_users') }
  end
end
