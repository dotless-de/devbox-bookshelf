if node["devbox"]["mysql_server"]["use_percona"]
  include_recipe 'devbox::_percona_mysql'
else
  include_recipe 'devbox::_mysql'
end
