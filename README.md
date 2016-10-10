[![Build Status](https://travis-ci.org/ifunky/ifunky-octopus.svg?branch=master)](https://travis-ci.org/ifunky/ifunky-octopus)
#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup requirements](#setup-requirements)    
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the installation, config and registration of Octopus Tentacles with the Octopus server.

## Module Description

This module will download and configure an Octopus tentacle followed by registration with the Octopus server.  
The concept behind this module is to easily add new machines to Octopus when creating new servers. 
It has been also built with the enterprise in mind - download through proxy servers and optional package sources 

* Default packages are installed with Chocolatey but optionally you can also specify an internal URL
* Automatically add new machines to the Octopus server
* Windows support only at the moment

### Setup Requirements

This module requires the following before you can use it:
 * Chocolatey installed (if using the default settings)

## Usage

#### Using the default settings
```puppet
class { 'octopus':
  server_url => 'http://octopus-server.net',
}
```

#### Custom MSI Source
```puppet
class { 'octopus':
  server_url       => 'http://octopus-server.net',
  package_source   => '\\fileserver\octopus\Octopus.Tentacle.3.4.12.msi',
  package_provider => 'msi',
}
```

## Reference

### Classes

* `octopus`: Install the Octopus tentacle and register with the server.

## Limitations

* Windows only at the moment

## Development

Please feel free to fork add some code and tests :-)
