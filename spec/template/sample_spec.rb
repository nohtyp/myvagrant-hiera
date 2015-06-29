require 'spec_helper'

describe file('/etc/selinux/config') do
  it { should be_mode 444 }
end

describe user('puppet') do
  it { should exist }
end

describe file('/etc/sysctl.conf') do
  its(:content) { should match /net.ipv4.ip_forward = 0/ } 
end

describe file('/etc/sysctl.conf') do
  its(:content) { should match /net.ipv4.tcp_syncookies = 1/ } 
end

describe file('/etc/puppet/modules') do
  it { should be_mounted }
end
