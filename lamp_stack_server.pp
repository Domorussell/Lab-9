package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}


package { 'mariadb-server':
  ensure => installed,
}

package { 'mariadb-server':
  ensure => installed,
  notify  => Service['mariadb'],
  require => [Package['mariadb-server']],
}

service { 'mariadb':
  ensure => running,
  enable => true,
  require => [Package['mariadb-server'], Package['mariadb']]
}

file { '/var/www/html/phpinfo.php':
  source => '/home/noah7/nr_inet4031_puppet_lab9/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}
