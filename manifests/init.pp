class phpmyadmin(
  $ensure     = $phpmyadmin::params::ensure,
  $version    = $phpmyadmin::params::version,
  $installdir = $phpmyadmin::params::instdir,
) inherits phpmyadmin::params {

	include phpmyadmin::dependencies
	case $ensure {
		present: { phpmyadmin::install   {$version: installdir => $installdir} }
		absent : { phpmyadmin::uninstall {'uninstall':} }
		default: { fail("Unsupported option for \"ensure\" param: ${ensure}") }
	}
}
