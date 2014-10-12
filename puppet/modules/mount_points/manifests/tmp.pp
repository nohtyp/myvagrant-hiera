class mount_points::tmp inherits mount_points {

  file {'/tmp':
    ensure   => $tmp_ensure,
    path     => $tmp_path,
    owner    => $tmp_owner,
    group    => $tmp_group,
    mode     => $tmp_mode,
  }
}
