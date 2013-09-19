include_attribute "mysql::server"

override["mysql"]["server_debian_password"] = 'mysql'
override["mysql"]["server_root_password"]   = 'mysql'
override["mysql"]["server_repl_password"]   = 'mysql'
override["mysql"]["bind_address"]           = '0.0.0.0'
