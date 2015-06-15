# puppet-bash

[![Build Status](https://travis-ci.org/zanloy/puppet-bash.svg?branch=master)](https://travis-ci.org/zanloy/puppet-bash)

Manage BASH via puppet.

Bash is the GNU Project's shell. Bash is the Bourne Again SHell. Bash is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and C shell (csh). It is intended to conform to the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard. It offers functional improvements over sh for both programming and interactive use. In addition, most sh scripts can be run by Bash without modification.

## Usage

Install bash with default values
```
class { '::bash': }
```
Install bash with vi-mode keybinds
```
class { '::bash':
  vi_mode => true,
}
```

## Class parameters

* package
  * Default: os-specific
  * Description: Package name of bash to install
* bashrc
  * Default: os-specific
  * Description: The path for system bashrc
* bashrcd
  * Default: '/etc/bashrc.d'
  * Description: The path for the dynamic bashrc directory
* bashrcd_purge
  * Allowed values: [true, false]
  * Default: true
  * Description: Whether the module should purge unmanaged files in bashrc.d
* environment
  * Default: ''
  * Description: The environment for the node. If set to 'production' then the
    bash prompt uses red colors to alert the user that they are in production.
* trim_suffix
  * Default: ''
  * Description: The suffix to trim from the fqdn for the bash prompt.
  * Example: '.example.com' will create a prompt for db.dev.example.com that
    shows as [ user@db.dev ~ ]
* vi_mode
  * Allowed valued: [true, false]
  * Description: Whether to use vi keybinds instead of emacs.
* additional_lines
  * Default: []
  * Description: An array of lines to be added at the end of /etc/bashrc
  * Example: ['umask 022']
