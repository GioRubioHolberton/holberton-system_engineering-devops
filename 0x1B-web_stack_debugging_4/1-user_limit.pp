# User limit 
exec {'hard':
command  => "sed -i 's/holberton hard nofile 5/holberton hard no file 10048/g' \
/etc/security/limits.conf",
provider => shell
}
-> exec {'soft':
command  => "sed -i 's/holberton soft nofile 4/holberton soft no file 30048/g' \
/etc/security/limits.conf",
provider => shell
}
-> exec {'restart':
command  => 'sysctl -p',
provider => shell
}
