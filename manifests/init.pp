# Read README.md file for full documentation
#
# === Authors
#
# Zan Loy <zan.loy@gmail.com>
#
# === Copyright
#
# Copyright 2014
#
class bash(
  $package       = $bash::params::package,
  $bashrc        = $bash::params::bashrc,
  $bashrcd       = $bash::params::bashrcd,
  $bashrcd_purge = $bash::params::bashrcd_purge,
  $environment   = $bash::params::environment,
  $append_paths  = $bash::params::append_paths,
  $trim_suffix   = $bash::params::trim_suffix,
  $vi_mode       = $bash::params::vi_mode,
  $aliases       = $bash::params::aliases,
) inherits bash::params {

  package { $package:
    ensure => present,
  }

  # Set file resource defaults
  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    require => Package['bash'],
  }

  file { $bashrcd:
    ensure  => directory,
    source  => "puppet:///modules/${module_name}/etc/bashrc.d",
    recurse => true,
    force   => true,
    purge   => $bashrcd_purge,
  }

  file { $bashrc:
    ensure => file,
    content => template("${module_name}/bashrc.erb");
  }

}
