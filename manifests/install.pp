# This is a private class called from init.pp to deal with installation.
#
#
class octopus::install {

  include ::octopus

  notify { "version: ${octopus::tentacle_version}": }

  package { 'octopusdeploy.tentacle':
    ensure   => $octopus::tentacle_version,
    provider => 'chocolatey',
  }

}