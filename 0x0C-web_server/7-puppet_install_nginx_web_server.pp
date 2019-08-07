#Install nginx via puppet
node 'demo' {
  package { 'nginx':
    ensure => installed,
  }
}
