# User limit
exec { 'change hard':
command  => "sed -i 's/holberton hard nofile 5/holberton hard nofile 10048/g' \
/etc/security/limits.conf",
provider => shell
}->

exec {'change soft':
command  => "sed -i 's/holberton soft nofile 4/holberton soft nofile 30048/g' \
/etc/security/limits.conf",
provider => shell
}->

exec { 'restart':
command  => 'sysctl -p',
provider => shell
