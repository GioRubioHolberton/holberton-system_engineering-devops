# client configuration file with Puppet comands 
file {'/etc/ssh/ssh_config':
  ensure => present,
}

file_line { 'password':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => '^PasswordAuthentication.*$',
}

file_line { 'identity':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/holberton',
  match  => '^IdentityFile.$',
}
