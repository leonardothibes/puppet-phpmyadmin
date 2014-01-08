class phpmyadmin::dependencies
{
    if $osfamily != 'Debian' {
        fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }   
    require wget
    phpmyadmin::secure::install {['php5', 'php5-mysql', 'mysql-server']:}
	service {'mysql':
		ensure  => running,
		require => Package['mysql-server'],
	}
}
