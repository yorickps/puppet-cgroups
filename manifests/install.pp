# @summary Configure the `cgroups` service
#
class cgroups::install {

  ensure_packages([$cgroups::package_name])

  file { $cgroups::config_file_path:
    ensure  => file,
    notify  => Service[$cgroups::service_name],
    content => template('cgroups/cgroup.conf.erb'),
    require => Package[$cgroups::package_name],
  }

  create_resources('cgroups::group', $cgroups::groups)

}
