# == Class: atomic
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL,
#   Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include atomic
#
class atomic (
  $proxy       = $atomic::params::proxy,
  $includepkgs = $atomic::params::includepkgs,
  $exclude     = $atomic::params::exclude
) inherits atomic::params {

  $gpgkeys = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt
  file:///etc/pki/rpm-gpg/RPM-GPG-KEY.atomicorp.txt"

  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {

    # This will be 5 or 6 on RedHat, 6 or wheezy on Debian, 12 or quantal
    # on Ubuntu, etc.
    $osr_array = split($::operatingsystemrelease,'[\/\.]')
    $distrelease = $osr_array[0]

    yumrepo { 'atomic-testing':
      baseurl        => absent,
      mirrorlist     => "http://updates.atomicorp.com/channels/mirrorlist/atomic-testing/centos-${distrelease}-${::architecture}",
      failovermethod => 'priority',
      proxy          => $proxy,
      includepkgs    => $includepkgs,
      exclude        => $exclude,
      enabled        => '0',
      gpgcheck       => '1',
      gpgkey         => $gpgkeys,
      descr          => "CentOS / Red Hat Enterprise Linux ${distrelease} - atomicrocketturtle.com (Testing)"
    }


    yumrepo { 'atomic-bleeding':
      baseurl        => absent,
      mirrorlist     => "http://updates.atomicorp.com/channels/mirrorlist/atomic-bleeding/centos-${distrelease}-${::architecture}",
      failovermethod => 'priority',
      proxy          => $proxy,
      includepkgs    => $includepkgs,
      exclude        => $exclude,
      enabled        => '0',
      gpgcheck       => '1',
      gpgkey         => $gpgkeys,
      descr          => "CentOS / Red Hat Enterprise Linux ${distrelease} - atomicrocketturtle.com (Bleeding)"
    }

    yumrepo { 'atomic':
      baseurl        => absent,
      mirrorlist     => "http://updates.atomicorp.com/channels/mirrorlist/atomic/centos-${distrelease}-${::architecture}",
      failovermethod => 'priority',
      proxy          => $proxy,
      includepkgs    => $includepkgs,
      exclude        => $exclude,
      enabled        => '1',
      gpgcheck       => '1',
      gpgkey         => $gpgkeys,
      descr          => "CentOS / Red Hat Enterprise Linux ${distrelease} - atomicrocketturtle.com"
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/atomic/RPM-GPG-KEY.art.txt',
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.atomicorp.txt':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/atomic/RPM-GPG-KEY.atomicorp.txt',
    }

    atomic::rpm_gpg_key{ 'art':
      path => '/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt'
    }

    atomic::rpm_gpg_key{ 'atomicorp':
      path => '/etc/pki/rpm-gpg/RPM-GPG-KEY.atomicorp.txt'
    }

  } else {
    notice ("Your operating system ${::operatingsystem} will not have the atomic repository applied")
  }


}
