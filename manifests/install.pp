define phpmyadmin::install($version = $title, $installdir)
{
	# Params
	$pkgname     = "phpMyAdmin-${version}-all-languages.tar.bz2"
	$urlsource   = "https://files.phpmyadmin.net/phpMyAdmin/${version}/phpMyAdmin-${version}-all-languages.tar.bz2" 
	$destination = "${phpmyadmin::params::srcdir}/${pkgname}"
	# Params

	# Creating source directory
	if !defined(File[$phpmyadmin::params::srcdir]) {
		file {$phpmyadmin::params::srcdir:
			ensure => directory,
			owner  => root,
			group  => root,
			mode   => '0755',
		}
	}
	# Creating source directory

	# Downloading the package
	wget::fetch {'wget-phpmyadmin':
		source      => $urlsource,
		destination => $destination,
		before      => Exec['tar-phpmyadmin'],
	}
	# Downloading the package

	# Unpacking the source
	exec {'tar-phpmyadmin':
		command => "tar -jxf ${destination}",
		path    => ['/bin','/usr/bin'],
		cwd     => $phpmyadmin::params::srcdir,
		onlyif  => [
			"test -f ${destination}",
			"test ! -d ${phpmyadmin::params::srcdir}/phpMyAdmin-${version}-all-languages",
		],
		before  => Exec['copy-phpmyadmin'],
	}
	# Unpacking the source

	# Installing the phpMyAdmin
	file {$phpmyadmin::params::instdir:
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => '0755',
	}
	exec {'copy-phpmyadmin':
		command => "cp -Rf ${phpmyadmin::params::srcdir}/phpMyAdmin-${version}-all-languages ${phpmyadmin::params::instdir}/${version}",
		path    => ['/bin','/usr/bin'],
		onlyif  => [
			"test -d ${phpmyadmin::params::srcdir}/phpMyAdmin-${version}-all-languages",
			"test ! -d ${phpmyadmin::params::instdir}/${version}",
		],
		require => File[$phpmyadmin::params::instdir],
	}
	file {"${phpmyadmin::params::instdir}/current":
		ensure => link,
		target => "${phpmyadmin::params::instdir}/${version}",
	}
	# Installing the phpMyAdmin
}
