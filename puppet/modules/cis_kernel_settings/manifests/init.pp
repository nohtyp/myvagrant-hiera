# == Class: cis_kernel_settings
#
# Full description of class cis_kernel_settings here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cis_kernel_settings:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class cis_kernel_settings (
  $manage_sysctl                           = $cis_kernel_settings::params::manage_sysctl,
  $kernel_sysctl_config                    = $cis_kernel_settings::params::kernel_sysctl_config,
) inherits cis_kernel_settings::params {

validate_absolute_path($kernel_sysctl_config)


anchor {'::cis_kernel_settings::begin':} ->
 class {'::cis_kernel_settings::config':} ->
anchor {'::cis_kernel_settings::end':}
}
