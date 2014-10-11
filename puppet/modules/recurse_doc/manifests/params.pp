class recurse_doc::params {

  case $::osfamily {
           'RedHat': {
                    $file_doc_ensure        = directory
                    $usr_share_doc_path     = '/usr/share/doc'
                    $usr_share_doc_user     = 'root'
                    $usr_share_doc_group    = 'root'
                    $usr_share_doc_mode     = '0644'
                    $usr_share_doc_recurse  = true
                 }
            default: {
                   fail("The module ${module_name} is not supported on an ${::osfamily} based system.")
                 }
       }
}
           

