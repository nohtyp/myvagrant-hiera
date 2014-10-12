class manage_root::directory inherits manage_root {

  file {'/root':
    ensure    => $root_ensure,
    path      => $root_path,
    owner     => $root_owner,
    group     => $root_group,
    mode      => $root_mode,
  }
}
