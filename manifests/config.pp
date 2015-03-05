# Public: Set confguration directives in a .d directory
#
# name   - Name of the configuration directive, for example cache-ttl
# value  - Value of the config, for cache-ttl it could be 20
# ensure - Ensure it to be either present or absent
#
# Example:
#
#    powerdns::config { 'cache-ttl':
#      ensure => present,
#      value  => 20,
#    }
#
define powerdns::config($value, $ensure='present') {

  file { "${name}.conf":
    ensure  => $ensure,
    path    => "${powerdns::params::cfg_include_path}/${name}.conf",
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => "${name}=${value}",
    require => Class['powerdns::package'],
    notify  => Class['powerdns::service'],
  }

}
