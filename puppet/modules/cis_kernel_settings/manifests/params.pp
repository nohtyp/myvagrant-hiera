class cis_kernel_settings::params {
  
#  This option will be for future use to remove settings using augeas
#  $manage_sysctl = true
#

  case $::osfamily {
           'RedHat': {
             $kernel_sysctl_config              = '/etc/sysctl.conf'
             $ip_forward                        = 'net.ipv4.ip_forward = 0'
             $ip_all_send_redirects             = 'net.ipv4.conf.all.send_redirects = 0'
             $ip_default_send_redirects         = 'net.ipv4.conf.default.send_redirects = 0'
             $ip_all_accept_source_route        = 'net.ipv4.conf.all.accept_source_route = 0'
             $ip_default_accept_source_route    = 'net.ipv4.conf.default.accept_source_route = 0'
             $ip_all_accept_redirects           = 'net.ipv4.conf.all.accept_redirects = 0'
             $ip_accept_redirects               = 'net.ipv4.conf.accept_redirects = 0'
             $ip_all_secure_redirects           = 'net.ipv4.conf.all.secure_redirects = 0'
             $ip_defaults_secure_redirects      = 'net.ipv4.conf.defaults.secure_redirects = 0'
             $ip_all_log_martians               = 'net.ipv4.conf.all.log_martians = 1'
             $ip_default_log_martians           = 'net.ipv4.conf.default.log_martians = 1'
             $icmp_echo_ignore_broadcasts       = 'net.ipv4.icmp_echo_ignore_broadcasts = 1'
             $icmp_ignore_bogus_error_responses = 'net.ipv4.icmp_ignore_bogus_error_responses = 1'
             $tcp_syncookies                    = 'net.ipv4.tcp_syncookies = 1'
             $kernel_randomized_va_space        = 'kernel.randomize_va_space = 2'
             $kernel_exec_shield                = 'kernel.exec-shield = 1'
             $fs_suid_dumpable                  = 'fs.suid_dumpable = 0'

             }
           default: {
             fail("The module ${module_name} is not supported on an ${::osfamily} based system.")
            }
      }
}
