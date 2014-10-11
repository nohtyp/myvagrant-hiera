# == Class: cis_passwd_files
#
# Full description of class cis_passwd_files here.
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
#  class { cis_passwd_files:
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
class cis_passwd_files ( 

$plain_text       = $cis_passwd_files::params::plain_text,
$encrypted_text   = $cis_passwd_files::params::encrypted_text,
) inherits cis_passwd_files::params {
 validate_array($plain_text) 
 validate_array($encrypted_text)


anchor {'::cis_passwd_files::begin': } ->
 class {'::cis_passwd_files::config': } ->
anchor {'::cis_passwd_files::end': }

}
