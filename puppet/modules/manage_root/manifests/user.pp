class manage_root::user inherits manage_root {

  user {'root user':
    ensure      => $root_user_present,
    name        => $root_name,
    comment     => $root_comment,
    managehome  => $root_manage,
    uid         => $root_uid,
    gid         => $root_gid,
  }
}
