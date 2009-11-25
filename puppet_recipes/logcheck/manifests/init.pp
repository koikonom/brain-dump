class logcheck {

    package { logcheck: ensure => latest }
    package { logcheck-database: ensure => latest}
    package {syslog-summary: ensure => latest}

    file { "/etc/logcheck/logcheck.conf":
        owner   => root,
        group   => logcheck,
        mode    => 440,
        source  => "puppet://puppetmaster.example.com/logcheck/logcheck.conf",
        require => Package["logcheck"],
    }

    file { "/etc/logcheck/logcheck.logfiles":
        owner   => root,
        group   => logcheck,
        mode    => 440,
        source  => "puppet://puppetmaster.example.com/logcheck/logcheck.logfiles",
        require => Package["logcheck"],
    }
}

