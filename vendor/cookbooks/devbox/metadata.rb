name             'devbox'
maintainer       'Robert Schulze'
maintainer_email 'robert@dotless.de'
license          'Mozilla Public License, version 2.0'
description      'Installs/Configures a Devbox Environment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

supports 'ubuntu', ">= 12.04"
supports 'centos', ">= 6.4"

depends "apt"
depends "yum"
depends "sudo"
depends "openssh"
depends "iptables"
depends "locale"
depends "nfs", ">= 0.3.0"

depends "apache2"

depends "database"
depends "postgresql"
depends "mysql"
depends "percona"
depends "redisio"

depends "git"
depends "subversion"

depends "ruby_install"
depends "imagemagick"
depends "nodejs"

depends "zsh"
depends "oh_my_zsh"
