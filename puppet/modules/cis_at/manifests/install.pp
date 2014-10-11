class cis_at::install inherits cis_at {

  package { 'at':
    ensure => $at_ensure,
    name   => $at_package_name,
  }
}
