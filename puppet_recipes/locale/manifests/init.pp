class locale{

    file { "/etc/default/locale":
	ensure  => file,
        owner   => root,
        group   => root,
        mode    => 444,
    }
}

