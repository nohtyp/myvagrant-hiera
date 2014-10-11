class cis_remove_users::params {
  
  $user_ensure = 'absent'


   case $::osfamily {
         'RedHat': {
                 $removed_users =  [ 
                   'uucp',
                   'operator',
                   'gopher',
                   'games',
                   'avahi-autoipd',
                   'lp',
                 ]
         }
         default: {
                 fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
         }
    }
}
