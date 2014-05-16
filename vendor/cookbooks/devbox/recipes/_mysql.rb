if node['mysql']['version'] == "5.6"

  case node['platform_family']
  when "debian", "ubuntu"

    include_recipe "apt"

    apt_repository "ondrej-mysql" do
      uri "http://ppa.launchpad.net/ondrej/mysql-5.6/ubuntu"
      distribution node['lsb']['codename']
      components ["main"]
      keyserver "keyserver.ubuntu.com"
      key "E5267A6C"

      deb_src true
      action :add
    end
    resources("apt_repository[ondrej-mysql]").run_action(:add)

    node.override['mysql']["use_upstart"] = false
    node.override['mysql']['server']['packages'] = ['mysql-server-5.6']
    node.override['mysql']['client']['packages'] = ['mysql-client-5.6 libmysqlclient-dev libaio-dev']

  end
end

include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "mysql::ruby"


if node['mysql']['version'] == "5.6"
  begin
    r = resources(:template => "#{node['mysql']['conf_dir']}/my.cnf")
    r.cookbook "devbox"
  rescue Chef::Exceptions::ResourceNotFound
    Chef::Log.warn "could not find template to override!"
  end
end
