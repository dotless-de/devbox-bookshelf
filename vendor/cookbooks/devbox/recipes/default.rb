#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright 2013, Robert Schulze
#
# Mozilla Public License, version 2.0
#

include_recipe value_for_platform(
  ["debian", "ubuntu"] => {:default => 'apt'},
  ["redhat", "centos", "fedora"] => {:default => 'yum'}
)

include_recipe "iptables::disabled"
include_recipe "openssh"
include_recipe "sudo"

include_recipe 'git'
include_recipe "locale"

# basic packages
pkgs = value_for_platform(
  ["debian", "ubuntu"] => {:default => ['man-db', 'vim', 'bash-completion']},
  ["redhat", "centos", "fedora"] => {:default => ['vim', 'bash-completion']}
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end
