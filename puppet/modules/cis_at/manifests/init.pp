# == Class: cis_at
#
# Full description of class cis_at here.
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
#  class { cis_at:
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
class cis_at ( 
  
  $ensure_at         = $cis_at::params::at_ensure,
  $remove_deny       = $cis_at::params::remove_deny,
  $at_package_name   = $cis_at::params::at_package_name,
  $at_file_name      = $cis_at::params::at_file_name,
  $at_deny_file_name = $cis_at::params::at_deny_file_name,
  $at_allow_owner    = $cis_at::params::at_allow_owner,
  $at_allow_group    = $cis_at::params::at_allow_group,
  $at_allow_mode     = $cis_at::params::at_allow_mode,
  $file_ensure       = $cis_at::params::file_ensure,
  $file_deny         = $cis_at::params::file_deny,
  $file_allow        = $cis_at::params::file_allow,
  $service_ensure    = $cis_at::params::service_ensure,
  $service_enable    = $cis_at::params::service_enable,
  $service_name      = $cis_at::params::service_name,
) inherits cis_at::params {

validate_array($at_package_name)
validate_bool($remove_deny)
validate_bool($service_enable)
validate_string($service_name)
validate_string($file_deny)
validate_string($service_ensure)
validate_absolute_path($at_file_name)
validate_absolute_path($at_deny_file_name)


anchor {'cis_at::begin': } ->
  class {'::cis_at::install':} ->
  class {'::cis_at::config':} ->
  class {'::cis_at::service':} ->
anchor {'cis_at::end':}
}
