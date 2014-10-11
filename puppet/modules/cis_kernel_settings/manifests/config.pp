class cis_kernel_settings::config inherits cis_kernel_settings {


  file_line {'fs_suid_dumpable':
    path => $kernel_sysctl_config,
    line => $fs_suid_dumpable,
  }
  file_line {'kernel_exec_shield':
    path => $kernel_sysctl_config,
    line => $kernel_exec_shield,
  }
  file_line {'kernel_randomized_va_space':
    path => $kernel_sysctl_config,
    line => $kernel_randomized_va_space,
  }
  file_line {'ip_forward':
    path => $kernel_sysctl_config,
    line => $ip_forward,
  }
  file_line {'ip_all_send_redirects':
    path => $kernel_sysctl_config,
    line => $ip_all_send_redirects,
  }
  file_line {'ip_default_send_redirects':
    path => $kernel_sysctl_config,
    line => $ip_default_send_redirects,
  }
  file_line {'ip_all_accept_source_route':
    path => $kernel_sysctl_config,
    line => $ip_all_accept_source_route,
  }
  file_line {'ip_default_accept_source_route':
    path => $kernel_sysctl_config,
    line => $ip_default_accept_source_route,
  }
  file_line {'ip_all_accept_redirects':
    path => $kernel_sysctl_config,
    line => $ip_all_accept_redirects,
  }
  file_line {'ip_accept_redirects':
    path => $kernel_sysctl_config,
    line => $ip_accept_redirects,
  }
  file_line {'ip_all_secure_redirects':
    path => $kernel_sysctl_config,
    line => $ip_all_secure_redirects,
  }
  file_line {'ip_defaults_secure_redirects':
    path => $kernel_sysctl_config,
    line => $ip_defaults_secure_redirects,
  }
  file_line {'ip_all_log_martians':
    path => $kernel_sysctl_config,
    line => $ip_all_log_martians,
  }
  file_line {'ip_default_log_martians':
    path => $kernel_sysctl_config,
    line => $ip_default_log_martians,
  }
  file_line {'icmp_echo_ignore_broadcasts':
    path => $kernel_sysctl_config,
    line => $icmp_echo_ignore_broadcasts,
  }
  file_line {'icmp_ignore_bogus_error_responses':
    path => $kernel_sysctl_config,
    line => $icmp_ignore_bogus_error_responses,
  }
  file_line {'tcp_syncookies':
    path => $kernel_sysctl_config,
    line => $tcp_syncookies,
  }
}
