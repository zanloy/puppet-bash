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
  $trim_suffix = ''
  $vi_mode = False
  $bashrcd = '/etc/bashrc.d'
  $bashrcd_purge = True

}
