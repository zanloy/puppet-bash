class bash::params {

  case $::osfamily {
    'Debian': {
      $bashrc = '/etc/bash.bashrc'
    }
    'RedHat': {
      $bashrc = '/etc/bashrc'
    }
  }

  $environment = ''
  $domain_suffix = ''
  $editing_mode = 'emacs'
  $bashrcd_purge = True

}
