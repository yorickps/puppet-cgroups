# @summary Manage the `cgroups` service

class cgroups::service {

if $cgroups::service_manage == true {
    service { 'cgconfig':
      ensure     => $cgroups::service_ensure,
      enable     => $cgroups::service_enable,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
