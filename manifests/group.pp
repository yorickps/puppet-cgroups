# == Define: cgroups::group
#
# Manage cgroup entries in /etc/cgconfig.d
#
define cgroups::group (
  Hash $permissions,
  Hash $controllers,
  Stdlib::Absolutepath $target_path,
) {

  # variables preparation
  $fscompat_name = regsubst($name, '\/', '-')
  $target = "${target_path}/${fscompat_name}.conf"

  file { $target:
    ensure  => file,
    content => template('cgroups/group.conf.erb'),
    notify  => Service[$cgroups::service_name],
  }
}
