class cron::allow inherits cron::params {

  if $allow_only == true {
    file {'/etc/cron.deny':
      ensure => $deny_ensure,
      path   => $deny_path,
    }
    file {'/etc/cron.allow':
      ensure => $allow_ensure,
      path   => $allow_path,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
}
