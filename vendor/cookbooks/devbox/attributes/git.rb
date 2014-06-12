include_attribute "git"

default['git']['version'] = '1.9.3'
default['git']['url'] = "https://www.kernel.org/pub/software/scm/git/git-#{node['git']['version']}.tar.gz"
default['git']['checksum'] = '71bca677efa3b87a060cba1de9e3512e7ab0f09197ef95d648e5280d9a6d1357'

default['devbox']['git']['mode'] = 'source'
