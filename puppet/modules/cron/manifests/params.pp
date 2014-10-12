class cron::params {

    $allow_only = true
   
    case $::osfamily {
        'RedHat': {
            $allow_ensure = file
            $deny_ensure  = 'absent'
            $deny_path    = '/etc/cron.deny'
            $allow_path   = '/etc/cron.allow'
         }
        default: {
            fail("This module ${module_name} is not supported on an ${::osfamily} based system.")
        }
    }
}
