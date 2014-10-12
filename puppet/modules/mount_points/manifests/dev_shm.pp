class mount_points::dev_shm inherits mount_points {

  mount {'/dev/shm':
    ensure  => $shm_ensure,
    name    => $shm_name,
    device  => $shm_device,
    fstype  => $shm_fstype,
    options => $shm_options,
  }
}
