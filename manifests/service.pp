# This is a private class called from init.pp to ensure the Tentacle is running
#
class octopus::service {
  service { 'OctopusDeploy Tentacle':
    ensure => running
  }
}