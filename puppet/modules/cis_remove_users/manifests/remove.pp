class cis_remove_users::remove inherits cis_remove_users {

  user { $removed_users:
    ensure => $user_ensure,
  }
}
