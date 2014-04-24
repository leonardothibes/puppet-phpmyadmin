class phpmyadmin::dependencies
{
    if $osfamily != 'Debian' {
        fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }
    require wget
    phpmyadmin::secure::install {['php5', 'php5-mysql','php5-mcrypt']:}
}
