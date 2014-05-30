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

include_recipe 'apt'

case node['platform']
when "ubuntu"
  if (node['platform_version'].to_f == 12.04) && (node['postgresql']['version'] == "9.2") && (! node['postgresql']['enable_pgdg_apt'])
    # add Pitti PPA apt repository for old postgresql version

    apt_repository "pitti-postgresql" do
      uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
      distribution node['lsb']['codename']
      components ["main"]
      keyserver "keyserver.ubuntu.com"
      key "8683D8A2"
      deb_src true
      action :add
    end
    resources("apt_repository[pitti-postgresql]").run_action(:add)
  end
end

include_recipe "postgresql"
include_recipe "postgresql::ruby"
include_recipe "postgresql::server"
include_recipe "postgresql::contrib"
include_recipe "postgresql::config_initdb"
include_recipe "postgresql::config_pgtune"

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
