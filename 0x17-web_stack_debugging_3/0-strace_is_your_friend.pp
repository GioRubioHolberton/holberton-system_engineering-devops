# find the issue 500 error, fix it and then automate it using Puppet.
exec { 'Fix':
	path    => '/bin/',
	command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
}
