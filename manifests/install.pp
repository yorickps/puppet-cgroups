# @summary Configure the `cgroups` service
#
class cgroups::install {

  ensure_packages([$cgroups::package_name])

}
