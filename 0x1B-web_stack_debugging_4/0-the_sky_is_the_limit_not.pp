# Sky is the limit, let's bring that limit higher
exec { 'Fix':
path    => '/bin/',
command => 'sed -i  "s/15/4095/g" /etc/default/nginx',
}->
exec { 'restart-nginx':
path    => '/usr/bin/',
command => 'service nginx restart',
}
