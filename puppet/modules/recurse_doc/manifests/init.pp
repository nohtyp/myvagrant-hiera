# == Class: recurse_doc
#
# Full description of class recurse_doc here.
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
#  class { recurse_doc:
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
class recurse_doc ( 

$usr_share_doc_path     = $recurse_doc::params::usr_share_doc_path,
$usr_share_doc_mode     = $recurse_doc::params::usr_share_doc_mode,
$usr_share_doc_user     = $recurse_doc::params::usr_share_doc_user,
$usr_share_doc_group    = $recurse_doc::params::usr_share_doc_group,
$file_doc_ensure        = $recurse_doc::params::file_doc_ensure,
$usr_share_doc_recurse  = $recurse_doc::params::usr_share_doc_recurse,

) inherits recurse_doc::params {

validate_absolute_path($usr_share_doc_path)
validate_string($usr_share_doc_mode)
validate_string($usr_share_doc_user)
validate_string($usr_share_doc_group)
validate_bool($usr_share_doc_recurse)


anchor {'::recurse_doc::begin':} ->
 class {'::recurse_doc::config':} ->
anchor {'::recurse_doc::end':}
}
