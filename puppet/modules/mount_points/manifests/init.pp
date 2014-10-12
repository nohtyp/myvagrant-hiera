# == Class: mount_points
#
# Full description of class mount_points here.
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
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { mount_points:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class mount_points (

$shm_ensure        = $mount_points::params::shm_ensure,
$shm_name          = $mount_points::params::shm_name,
$shm_device        = $mount_points::params::shm_device,
$shm_fstype        = $mount_points::params::shm_fstype,
$shm_options       = $mount_points::params::shm_options,
$home_ensure       = $mount_points::params::home_ensure,
$home_path         = $mount_points::params::home_path,
$home_owner        = $mount_points::params::home_owner,
$home_group        = $mount_points::params::home_group,
$home_mode         = $mount_points::params::home_mode,
$tmp_ensure        = $mount_points::params::tmp_ensure,
$tmp_path          = $mount_points::params::tmp_path,
$tmp_owner         = $mount_points::params::tmp_owner,
$tmp_group         = $mount_points::params::tmp_group,
$tmp_mode          = $mount_points::params::tmp_mode,
$vartmp_ensure     = $mount_points::params::vartmp_ensure,
$vartmp_target     = $mount_points::params::vartmp_target,
$vartmp_force      = $mount_points::params::vartmp_force,
) inherits mount_points::params {
validate_string($shm_options)
validate_absolute_path($home_path)
validate_string($home_owner)
validate_string($home_group)
validate_string($home_mode)
validate_string($tmp_path)
validate_string($tmp_owner)
validate_string($tmp_group)
validate_string($tmp_mode)
validate_bool($vartmp_force)

anchor {'::mount_points::begin':} ->
  class {'::mount_points::home':} ->
  class {'::mount_points::tmp':} ->
  class {'::mount_points::var_tmp':} ->
  class {'::mount_points::dev_shm':} ->
anchor {'::mount_points::end':}

}
