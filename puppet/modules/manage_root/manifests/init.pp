# == Class: manage_root
#
# Full description of class manage_root here.
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
#  class { manage_root:
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
class manage_root(

$root_user_present    = $manage_root::params::root_user_present,
$root_name            = $manage_root::params::root_name,
$root_comment         = $manage_root::params::root_comment,
$root_uid             = $manage_root::params::root_uid,
$root_gid             = $manage_root::params::root_gid,
$root_ensure          = $manage_root::params::root_ensure,
$root_path            = $manage_root::params::root_path,
$root_owner           = $manage_root::params::root_owner,
$root_group           = $manage_root::params::root_group,
$root_mode            = $manage_root::params::root_mode,
$root_manage          = $manage_root::params::root_manage,

) inherits manage_root::params {
validate_string($root_name)
validate_string($root_comment)
validate_string($root_uid)
validate_string($root_gid)
validate_absolute_path($root_path)
validate_string($root_owner)
validate_string($root_group)
validate_string($root_mode)
validate_bool($root_manage)


anchor {'::manage_root::begin':} ->
  class {'::manage_root::user':} ->
  class {'::manage_root::directory':} ->
anchor {'::manage_root::end':}
}
