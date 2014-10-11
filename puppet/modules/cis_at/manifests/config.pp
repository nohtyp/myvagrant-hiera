class cis_at::config inherits cis_at {

if $remove_deny == true {
    file {'at.deny':
      ensure => $file_deny,
      name   => $at_deny_file_name,
    }
    file {'at.allow':
      ensure => $file_allow,
      name   => $at_file_name,
      owner  => $at_allow_owner,
      group  => $at_allow_group,
      mode   => $at_allow_mode,
    }
  }
}
