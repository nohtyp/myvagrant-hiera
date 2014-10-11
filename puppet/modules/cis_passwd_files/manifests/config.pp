class cis_passwd_files::config inherits cis_passwd_files {

  file {$plain_text :
    ensure => $file_present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  file {$encrypted_text :
    ensure => $file_present,
    owner  => 'root',
    group  => 'root',
    mode   => '0000',
  }
}
