class mount_points::var_tmp inherits mount_points {

  file {'/var/tmp':
    ensure           => $vartmp_ensure,
    target           => $vartmp_target,
    force            => $vartmp_force,
  }
}
