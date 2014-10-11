# == Class: atomic::params
#
# Optional parameters in setting up Atomic Repo
#
class atomic::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Settings here will be the default for all repos.
  #
  #  If you wish to set a value for an individual set of repos,
  #   you can declare the variable in that class, and should scope to
  #   the most specific declaration.
  $proxy       = 'absent'
  $includepkgs = 'absent'
  $exclude     = 'absent'
}
