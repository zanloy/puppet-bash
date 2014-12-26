# === Authors
#
# Zan Loy <zan.loy@gmail.com>
#
# === Copyright
#
# Copyright 2014
#
class bash(
  $environment   = $bash::params::environment,
  $bashrc        = $bash::params::bashrc,
  $domain_suffix = $bash::params::domain_suffix,
  $editing_mode  = $bash::params::editing_mode,
  $bashrcd_purge = $bash::params::bashrcd_purge,
) inherits bash::params {

  package { 'bash':
    ensure => present,
  }

  # Set file resource defaults
  File {
    owner => 'root',
    group => 'root',
    mode => '0444',
    require => Package['bash'],
  }

  file { '/etc/bashrc.d':
    ensure => directory,
    source => "puppet:///modules/${module_name}/etc/bashrc.d",
    recurse => true,
    force => true,
    purge => $bashrcd_purge,
  }

  file { $bashrc:
    ensure => file,
    content => template("${module_name}/bashrc.erb");
  }

}
