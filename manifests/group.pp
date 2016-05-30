define cgroups::group (
  $permissions = {},
  $controllers = {},
  $target_path = '/etc/cgconfig.d',
) {

  $fscompat_name = regsubst($name, '\/', '-')
  $target = "${target_path}/${fscompat_name}.conf"

  validate_hash($permissions)
  validate_hash($controllers)
  validate_absolute_path($target)

  include ::cgroups

  file { $target:
    ensure  => file,
    content => template('cgroups/group.conf.erb'),
    notify  => Service[$cgroups::service_name],
  }
}
