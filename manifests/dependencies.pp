class phpmyadmin::dependencies
{
    if $osfamily != 'Debian' {
        fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }   
    require wget
    package {['php5', 'php5-mysql', 'mysql-server']: ensure  => present}
	service {'mysql':
		ensure  => running,
		require => Package['mysql-server'],
	}
}
