class manage_root::params {

  case $::osfamily {
      'RedHat': {
        $root_user_present    = present
        $root_name            = 'root'
        $root_comment         = 'The root user is managed by puppet. Do not modify by hand'
        $root_uid             = '0'
        $root_gid             = '0'
        $root_ensure          = directory
        $root_path            = '/root'
        $root_owner           = 'root'
        $root_group           = 'root'
        $root_mode            = '0700'
        $root_manage          = true
        }
       default: {
         fail("The module ${module_name} is not supported on an ${::osfamily} based system.")
         } 
    }
}
