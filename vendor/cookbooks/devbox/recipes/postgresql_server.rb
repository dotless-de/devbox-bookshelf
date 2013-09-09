#
# Cookbook Name:: devbox
# Recipe:: postgresql_server
#
# Copyright 2013, Robert Schulze
#
# Mozilla Public License, version 2.0
#
# This a a wrapper recipe for installing a
# development-friendly postgresql server

include_recipe "postgresql"
include_recipe "postgresql::ruby"
include_recipe "postgresql::server"
include_recipe "postgresql::config_initdb"

begin
  r = resources(:template => "#{node['postgresql']['dir']}/pg_hba.conf")
  r.cookbook "devbox"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template to override!"
end

case node['platform']
when "redhat", "centos", "fedora"
  execute "make pg_config available" do
    command "update-alternatives --install /usr/bin/pg_config pg_config /usr/pgsql-#{node['postgresql']['version']}/bin/pg_config 1"
  end
end
