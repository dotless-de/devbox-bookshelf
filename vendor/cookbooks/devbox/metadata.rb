name             'devbox'
maintainer       'Robert Schulze'
maintainer_email 'robert@dotless.de'
license          'Mozilla Public License, version 2.0'
description      'Installs/Configures a Devbox Environment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu', ">= 12.04"
supports 'centos', ">= 6.4"

%w{ apt yum sudo openssh iptables git locale database postgresql mysql nodejs ruby_install imagemagick }.each do |cookbook|
  depends cookbook
end

depends "nfs", ">= 0.3.0"
