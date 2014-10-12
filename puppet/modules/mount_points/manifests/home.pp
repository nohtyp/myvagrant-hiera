class mount_points::home inherits mount_points {

  file {'/home':
    ensure    => $home_ensure,
    path      => $home_path,
    owner     => $home_owner,
    group     => $home_group,
    mode      => $home_mode,
  }
}
