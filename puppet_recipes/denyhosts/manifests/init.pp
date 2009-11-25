class denyhosts {

    package { denyhosts: ensure => latest }

    file { "/etc/hosts.allow":
        owner   => root,
        group   => root,
        mode    => 440,
        source  => "puppet://puppetmaster.example.com/denyhosts/hosts.allow",
        require => Package["denyhosts"],
    }

    file { "/etc/denyhosts.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        content => template("denyhosts.conf.erb"),
        require => Package["denyhosts"],
    }

   file { "/var/lib/denyhosts/allowed-hosts":
	owner => root,
	group => root,
	mode  => 440,
	source => "puppet://puppetmaster.example.com/denyhosts/allowed-hosts",
	require => Package["denyhosts"]
    }

    @service { denyhosts:
	ensure => running,
	enable => true,
    }
}

