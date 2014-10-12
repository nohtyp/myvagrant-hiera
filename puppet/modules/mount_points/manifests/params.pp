class mount_points::params {

      case $::osfamily {
          'RedHat': {
            $shm_ensure       = present
            $shm_name         = '/dev/shm'
            $shm_device       = 'tmpfs'
            $shm_fstype       = 'tmpfs'
            $shm_options      = 'defaults,nodev,noexec,nosuid'
            $home_ensure      = directory
            $home_path        = '/home'
            $home_owner       = 'root'
            $home_group       = 'root'
            $home_mode        = '0755'
            $tmp_ensure       = directory
            $tmp_path         = '/tmp'
            $tmp_owner        = 'root'
            $tmp_group        = 'root'
            $tmp_mode         = '1777'
            $vartmp_ensure    = link
            $vartmp_target    = '/tmp'
            $vartmp_force     = true
            }
          default: {
              fail("This module ${module_name} is not supported on an ${::osfamily} based system")
            }
      }
}
