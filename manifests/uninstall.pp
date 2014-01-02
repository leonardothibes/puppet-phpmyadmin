define phpmyadmin::uninstall
{
	# Removing phpMyAdmin install dir
	exec {"rm -Rf ${phpmyadmin::params::instdir}": path => '/bin'}

	# Removing the source
	exec {"rm -Rf ${phpmyadmin::params::srcdir}/phpMyAdmin-*": path => '/bin'}
}
