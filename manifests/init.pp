# This module manages Octopus Deploy tentacle installation and registration
#
# @example when declaring the class
#   octopus { 'template':
#     server_url  = "http://octopus-server.net"
#   }
#
# @param ensure Required. Must be 'present' or 'absent
# @param example_path Required.  Path to somewhere
#
# @author Dan @ iFunky.net
class octopus (
  $server_url       = undef,
  $tentacle_version = $octopus::params::tentacle_version,
  $ensure           = undef
) inherits octopus::params {

  if (downcase($::osfamily) != 'windows') {
    fail 'ERROR:: This module will only work on Windows.'
  }

  validate_re($server_url, ['^(http(?:s)?\:\/\/[a-zA-Z0-9]+(?:(?:\.|\-)[a-zA-Z0-9]+)+(?:\:\d+)?(?:\/[\w\-]+)*(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$'], "ERROR: You must enter a server url in a valid format i.e. http://octopus.net")
  validate_re($ensure,['^(present|absent)$'], 'ERROR: You must specify present or absent')
  validate_re($tentacle_version,['^(\d+\.)?(\d+\.)?(\*|\d+)$'], 'ERROR: You must specify a numeric value')
  #validate_absolute_path($example_path)

  #if (empty($example_path)){
  #  fail 'ERROR:: example_path was not specified'
  #}

  class { '::octopus::install': } ->
  class { '::octopus::config': } ~>
  class { '::octopus::service': } ->
  Class['::octopus']

}
