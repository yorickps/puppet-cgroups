# == Class: cgroups
#
# Manage cgroups configuration service and files.
#
class cgroups (
  Boolean $service_enable,
  Boolean $service_manage,
  Enum['running', 'stopped'] $service_ensure,
  Hash $groups,
  Hash $mounts,
  Optional[Stdlib::Absolutepath] $config_file_path,
  Optional[Stdlib::Absolutepath] $user_path_fix,
  String $cgconfig_content,
  String $package_name,
  String $service_name,
) {

  contain ::cgroups::install
  contain ::cgroups::service

  Class['cgroups::install'] ~> Class['cgroups::service']

}
