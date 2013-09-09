#
# Cookbook Name:: nfs_server
# Recipe:: default
#
# Copyright 2013, Robert Schulze
#
# Mozilla Public License, version 2.0
#

include_recipe "nfs"
include_recipe "nfs::server"

nfs_export "/home/vagrant" do
  network '0.0.0.0/0.0.0.0'
  writeable true
  sync true
  options ['no_subtree_check', 'insecure', 'all_squash'] | value_for_platform(
    ["debian", "ubuntu"] => {:default => ['anonuid=1000', 'anongid=1000']},
    ["redhat", "centos", "fedora"] => {:default => ['anonuid=500', 'anongid=500']}
  )
end
