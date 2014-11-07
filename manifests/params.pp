class bash::params {

  case $::osfamily {
    'Debian': {
      $bashrc = '/etc/bash.bashrc'
    }
    'RedHat': {
      $bashrc = '/etc/bashrc'
    }
  }

}
