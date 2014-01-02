puppet-phpmyadmin
=================

A Puppet module that installs phpMyAdmin.

## Sample Usage
Install phpmyadmin and use the provided configuration defaults:
```puppet
node default {
	class {'phpmyadmin':}
}
```
or
```puppet
node default {
	include phpmyadmin
}
```

Uninstall phpmyadmin:
```puppet
node default {
	class {'phpmyadmin':
		ensure => absent,
	}
}
```

Contact
-------

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-phpmyadmin/issues)
