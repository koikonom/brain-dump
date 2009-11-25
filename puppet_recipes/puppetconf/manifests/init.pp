class puppetconf {

    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 444,
        source  => "puppet://puppetmaster.example.com/puppetconf/puppet.conf",
    }
}

