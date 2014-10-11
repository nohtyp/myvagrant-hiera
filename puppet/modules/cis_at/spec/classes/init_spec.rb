require 'spec_helper'
describe 'cis_at' do

  context 'with defaults for all parameters' do
    it { should contain_class('cis_at') }
  end
end
