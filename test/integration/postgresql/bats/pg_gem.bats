@test "pg gem for chef installed" {
	# bats overwrited GEM_PATHS, so we need to run as vagrant
	sudo -u vagrant /opt/chef/embedded/bin/gem list pg | grep pg
}

@test "can install pg gem for user-ruby" {
  run sudo -u vagrant -i chruby-exec ruby-1.9.3-p429 -- gem install pg

  [[ "$output" == *Successfully\ installed\ pg* ]]
}
