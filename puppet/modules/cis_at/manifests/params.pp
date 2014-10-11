class cis_at::params {
  
  $remove_deny = false 


  case $::osfamily {
      'RedHat': {
        $file_allow          = file
        $file_deny           = 'absent'
        $at_package_name     = ['at']
        $at_file_name        = '/etc/at.allow'
        $at_deny_file_name   = '/etc/at.deny'
        $at_allow_owner      = 'root'
        $at_allow_group      = 'root'
        $at_allow_mode       = '0600'
        $at_ensure           = 'installed'
        $service_ensure      = 'running'
        $service_enable      = true
        $service_name        = 'atd'
      }
      default: {
        fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
      }
  }
}
