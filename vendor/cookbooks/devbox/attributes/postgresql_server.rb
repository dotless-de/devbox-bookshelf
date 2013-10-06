include_attribute "postgresql"

default['postgresql']['version'] = "9.1"

default['postgresql']['config']['listen_addresses']           = "*"
default['postgresql']['config']["authentication_timeout"]     = "10s"
default['postgresql']['config']['lc_messages']                = 'en_US.UTF-8'
default['postgresql']['config']['lc_monetary']                = 'en_US.UTF-8'
default['postgresql']['config']['lc_numeric']                 = 'en_US.UTF-8'
default['postgresql']['config']['lc_time']                    = 'en_US.UTF-8'
default['postgresql']['config']['default_text_search_config'] = 'pg_catalog.english'

default['postgresql']["password"] = {
  "postgres" => "postgres"
}

default['postgresql']["pg_hba"] = [
  {
    :comment => "# Database administrative login by UNIX sockets",
    :type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'trust'
  },
  {
    :type => 'local', :db => 'all', :user => 'vagrant', :addr => nil, :method => 'trust'
  },
  {
    :comment => '# IPv4 local connections:',
    :type => 'host', :db => 'all', :user => 'all', :addr => '127.0.0.1/32', :method => 'trust'
  },
  {
    :comment => '# IPv6 local connections:',
    :type => 'host', :db => 'all', :user => 'all', :addr => '::1/128', :method => 'trust'
  },
  {
    :comment => '# Dev-Host connections:',
    :type => 'host', :db => 'all', :user => 'all', :addr => '33.33.33.0/8', :method => 'trust'
  },
  {
    :type => 'host', :db => 'all', :user => 'all', :addr => '192.168.33.0/8', :method => 'trust'
  }
]

case node['platform']
when "ubuntu"

  default['postgresql']['config']['ssl']                      = true
  default['postgresql']['config']["ssl_cert_file"]            = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
  default['postgresql']['config']["ssl_key_file"]             = '/etc/ssl/private/ssl-cert-snakeoil.key'
  default['postgresql']['config']["#ssl_ciphers"]             = 'ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH'
  default['postgresql']['config']["#ssl_renegotiation_limit"] = '512MB'
  default['postgresql']['config']["#ssl_ca_file"]             = ''
  default['postgresql']['config']["#ssl_crl_file"]            = ''


  if (node['platform_version'].to_f == 12.04) && (node['postgresql']['version'] == "9.2") && (! node['postgresql']['enable_pgdg_apt'])
    override['postgresql']['client']['packages']     = %w{ postgresql-client-9.2 libpq-dev }
    override['postgresql']['server']['packages']     = %w{ postgresql-9.2 }
    override['postgresql']['contrib']['packages']    = %w{ postgresql-contrib-9.2 }

    override['postgresql']['server']['service_name'] = "postgresql"
  end

when "redhat", "centos", "scientific", "oracle"
  default['postgresql']['enable_pgdg_yum'] = true

  default['postgresql']['dir']                    = "/var/lib/pgsql/#{node['postgresql']['version']}/data"

  default['postgresql']['client']['packages']     = ["postgresql#{node['postgresql']['version'].split('.').join}", "postgresql#{node['postgresql']['version'].split('.').join}-devel"]
  default['postgresql']['server']['packages']     = ["postgresql#{node['postgresql']['version'].split('.').join}-server"]
  default['postgresql']['contrib']['packages']    = ["postgresql#{node['postgresql']['version'].split('.').join}-contrib"]

  default['postgresql']['server']['service_name'] = "postgresql-#{node['postgresql']['version']}"
end
