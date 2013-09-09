@test "PostgreSQL is correct version" {
  psql --version | grep "9.2"
}

@test "Vagrant can create a PostgreSQL db as postgres" {
  sudo -u vagrant -i sh -c 'createdb -U postgres "vagrants_test_db"'
}
