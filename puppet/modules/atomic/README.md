# Configure Atomicorp Free RPMS Repository
A Puppet module to configure the Atomicorp Free RPMS Repository.

## Dependencies

* stdlib - https://forge.puppetlabs.com/puppetlabs/stdlib

## About
This module is a fork of https://github.com/stahnma/puppet-module-epel rewritten for the Atomicorp Free RPMS Repository (http://www.atomicorp.com/installers/atomic)

The following Repos will be setup and enabled by default:

  * atomic

Other repositories that will setup but disabled by default:

  * atomic-testing
  * atomic-bleeding

### Variables

Variables can be set via class parameters or editing the params.pp file.

### Proxy
If you have an HTTP proxy required to access the internet, you can use the
`$proxy` variable. If it is set to a value other than
'absent' a proxy will be setup with each repository.  Note that otherwise each
of the repos will fall back to settings in the /etc/yum.conf file.

### Including and Excluding Packages
If you want to linit what packages will be installed from the repositories, 
you can set the $includepkgs or $exclude variable. If these are not set they
will be absent from the configuration.

## Futher Information

* [Atomic Repository Installer](http://www.atomicorp.com/installers/atomic)
* [Atomic Repository List](https://www2.atomicorp.com/channels/atomic/centos/6/x86_64/)

## Testing

* Tested using Puppet 3.3.x on CentOS 6
