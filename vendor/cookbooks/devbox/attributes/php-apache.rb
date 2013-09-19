include_attribute "apache2"

default['apache']['default_modules'] = %w{
  status alias auth_basic authn_file authz_default authz_groupfile authz_host authz_user autoindex
  dir env mime negotiation setenvif
  php5 deflate expires headers rewrite xsendfile include
}

default['devbox']['php-apache']['server_aliases'] = [ "#{node['hostname']}.dev" ]
