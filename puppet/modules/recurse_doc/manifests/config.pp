class recurse_doc::config inherits recurse_doc {

  file {'/usr/share/doc':
    ensure   => $file_doc_ensure,
    path     => $usr_share_doc_path,
    owner    => $usr_share_doc_user,
    group    => $usr_share_doc_group,
    mode     => $usr_share_doc_mode,
    recurse  => $usr_share_doc_recurse,
  }
}

