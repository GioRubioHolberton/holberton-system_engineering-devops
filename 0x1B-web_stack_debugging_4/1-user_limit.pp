# User limit
exec { 'replace_hard':
command => "sed -i 's/holberton hard nofile 5/holberton hard nofile 10048/g' \
/etc/security/limits.conf",
provider => shell
}

exec {'replace_soft':
path    => 'usr/sbin',
command => "sed -i 's/holberton soft nofile 4/holberton soft nofile 30048/g' \
/etc/security/limits.conf",
provider => shell
}

exec { 'restart-op':
command => 'sysctl -p',
provider => shell
}
