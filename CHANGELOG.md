# puppet-module-cgroups

Changelog

##2016-05-31 - Release 2.0.0
###Breaking News

This release breaks with backward compatibility.

##### functionality / parameters that have been removed:
- ```cgroups::cgconfig_mount```

To keep the old behaviour with hiera you can add the old default values to your osfamily-release structure (eg %{osfamily}-%{operatingsystemrelease})

RedHat-6.yaml:
```yaml
cgroups::mounts:
  cpu: '/cgroup'
```

Suse-11.yaml:
```yaml
cgroups::mounts:
  cpu: '/sys/fs/cgroup'
```

Do not use this fix on RedHat 7 clients until you know exactly what you are doing.

####Features
- Add cgroups::mount parameter without hard coded defaults for more flexibility as successor of cgconfig_mount.
- Add cgroups::group defined resource type to place group definitions in the .d directory instead of main configuration file.
- Add cgroups::group::target_path to allow usage of specific configuration paths.
- Add cgroups::groups parameter for optionally adding cgroups::group types (via hiera for example).
- Add support for RedHat 7.

####Bugfixes
- Remove usage of $::lsbmajdistrelease in favour of $::operatingsystemrelease .
- Enhance the spec tests to feature much more test cases.

####Upgrading from 1.x
When upgrading from version 1.x you need to migrate your cgroups::cgconfig_mount entries into the new cgroups::mounts format.
The new format is a hash for greater flexibility. You have to add the subsystem for your mounts.

In most cases it should be good enough to change the parameter name, make it a hash and add the 'cpu' subsystem as key.

#####Hiera Example:
old deprecated string format
```yaml
cgroups::cgconfig_mount: '/cgroup'
```

new hash format
```yaml
cgroups::mounts:
  cpu: '/cgroup'
```
