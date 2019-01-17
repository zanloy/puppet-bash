# Manifest for default values
class bash::params {

  case $::osfamily {
    'ArchLinux': {
      $package = 'core/bash'
      $bashrc = '/etc/bash.bashrc'
    }
    'Debian': {
      $package = 'bash'
      $bashrc = '/etc/bash.bashrc'
    }
    'RedHat': {
      $package = 'bash'
      $bashrc = '/etc/bashrc'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }

  $environment = ''
  $append_paths = [ ]
  $trim_suffix = ''
  Boolean $vi_mode = false
  $aliases = { }
  $bashrcd = '/etc/bashrc.d'
  Boolean $bashrcd_purge = true

}
