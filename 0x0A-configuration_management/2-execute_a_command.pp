# kill a process killmenow that run on the machine
exec {'killmenow':
	path    => "/usr/bin:/usr/sbin:/bin",
	command => 'pkill killmenow',
}
