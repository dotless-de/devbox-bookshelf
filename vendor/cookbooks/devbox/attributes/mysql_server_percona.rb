include_attribute "percona"

default["percona"]["server"]["debian_password"] = 'mysql'
default["percona"]["server"]["root_password"]   = 'mysql'
default["percona"]["backup"]["password"]        = 'mysql'
default["percona"]["bind_address"]              = '0.0.0.0'

# version packages
default["percona"]["server"]["packages"] = ['percona-server-server-5.6']
normal['mysql']['client']['packages']    = ['libmysqlclient-dev', 'percona-server-client-5.6']
