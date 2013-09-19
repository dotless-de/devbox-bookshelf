#
# Cookbook Name:: devbox
# Recipe:: php-apache
#
# Copyright 2013, Robert Schulze
#
# Mozilla Public License, version 2.0
#

include_recipe "apache2"

web_app "vagrant_home" do
  cookbook "apache2"  # use original cookbook for template
  server_name node['hostname']
  server_aliases [node['fqdn']] | Array( node['devbox']['php-apache']['server_aliases'] )
  docroot "/home/vagrant"
  allow_override ["All"]
  enable true
end
