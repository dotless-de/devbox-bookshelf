#
# Cookbook Name:: devbox
# Recipe:: lib_qt_webkit
#
# Copyright 2013, Robert Schulze
#
# Mozilla Public License, version 2.0
#
# This is a meta recipe which installs and configures
# QtWebKit libraries

pkgs = value_for_platform(
  ["debian", "ubuntu"] => {:default => ['libqtwebkit-dev', 'libqt4-dev', 'xvfb', 'x11-xkb-utils', 'xfonts-100dpi', 'xfonts-75dpi', 'xfonts-scalable', 'xfonts-cyrillic']},
  ["redhat", "centos", "fedora"] => {:default => ['qt48-qt-webkit-devel', 'Xvfb', 'libXfont']}
)

case node['platform']
when "redhat", "centos", "fedora"
  yum_repository "epel-qt48" do
    description "Software Collection for Qt 4.8"
    url 'http://repos.fedorapeople.org/repos/sic/qt48/epel-$releasever/$basearch/'
    enabled true
    action :add
  end
  yum_repository "epel-qt48-source" do
    description "Software Collection for Qt 4.8 - Source"
    url 'http://repos.fedorapeople.org/repos/sic/qt48/epel-$releasever/SRPMS'
    enabled false
    action :add
  end
end

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

case node['platform']
when "centos"
  link "/opt/rh/qt48/root/usr/include/QtCore/qconfig-x86_64.h" do
    to "/opt/rh/qt48/root/usr/include/QtCore/qconfig-64.h"
  end

  file "/etc/profile.d/qmake.sh" do
    content <<-EOC.gsub /^\s+/, ""
      export QMAKE=qmake-qt4
      export PATH=/opt/rh/qt48/root/usr/lib64/qt4/bin/${PATH:+:${PATH}}
      source /opt/rh/qt48/enable
    EOC
    mode "0644"
    action :create
  end
end
