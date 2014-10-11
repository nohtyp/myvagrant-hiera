# Package installation
class ossec::common {
  case $::osfamily {
    'Debian' : {
      $hidsagentservice  = 'ossec-hids-agent'
      $hidsagentpackage  = 'ossec-hids-agent'
      $hidsserverservice = 'ossec-hids-server'
      $hidsserverpackage = 'ossec-hids-server'

      case $::lsbdistcodename {
        /(lucid|precise|trusty)/: {
          apt::ppa { 'ppa:nicolas-zin/ossec-ubuntu': }
        }
        default : { fail('This ossec module has not been tested on your distribution (or lsb package not installed)') }
      }
    }
    'Redhat' : {
      # Set up Atomic rpm repo
      class { '::atomic':
        includepkgs => 'ossec-hids*',
      }
      $hidsagentservice  = 'ossec-hids'
      $hidsagentpackage  = 'ossec-hids-client'
      $hidsserverservice = 'ossec-hids'
      $hidsserverpackage = 'ossec-hids-server'
      case $::operatingsystemrelease {
        /^5/:    {$redhatversion='el5'}
        /^6/:    {$redhatversion='el6'}
        /^7/:    {$redhatversion='el7'}
        default: { }
      }
      package { 'inotify-tools': ensure => present }
    }
    default : { fail('This ossec module has not been tested on your distribution') }
  }
}

