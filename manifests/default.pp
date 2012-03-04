Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}
stage { "update": before => Stage["pre"] }
stage { "pre": before => Stage["main"] }

class aptupdate {
      exec { "/usr/bin/apt-get update":}
}

class devlibs {
    package {
        "build-essential": ensure => latest;
        "libreadline-gplv2-dev": ensure => present;
        "libssl-dev": ensure => present;
        "sqlite3": ensure => present;
        "libsqlite3-dev": ensure => present;
    }
}

class { "python::dev": version => "2.7" }

python::venv::isolate { "/vagrant/projectenv": 
  version => "2.7"
}

file { '/home/vagrant/projectenv':
   ensure => 'link',
   target => '/vagrant/projectenv',
   require => Python::Venv::Isolate["/vagrant/projectenv"],
}

class { "postgresql::server": version => "9.1",
                    listen_addresses => 'localhost',
                    max_connections => 5,
                    shared_buffers => '24MB',
}

postgresql::user { "vagrant": ensure => present,
                    superuser => true,
                    createdb => true,
                    createrole => true,
}

postgresql::database { "vagrant":
  require => Postgresql::User["vagrant"]
}


class pildeps {
  package { 
  "libbz2-dev": ensure => present;
  "zlib1g-dev": ensure => present;
  "libfreetype6-dev": ensure => present;
  "libjpeg62-dev": ensure => present;
  "liblcms1-dev": ensure => present;
  }
}

class vcs {

  package { "git-core":
    ensure => present,
  }

}

class { "aptupdate": stage => "update"}
class { "devlibs": stage => "pre" }
class { "pildeps": stage => "pre" }
class { "vcs": stage => "pre" }

class maverick64 {
  include aptupdate
  include devlibs
  include pildeps
  include vcs
  include python::venv
  include postgresql::server 
}

include maverick64
