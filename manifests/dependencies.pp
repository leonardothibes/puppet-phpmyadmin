class phpmyadmin::dependencies
{
    if $osfamily != 'Debian' {
        fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }   
    require wget
    package {['php5']: ensure  => present}
}
