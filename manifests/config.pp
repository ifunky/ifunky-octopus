# This is a private class called from init.pp to deal with configuring an Octopus tentacle
#
class octopus::config {
  notify { 'config': }
}