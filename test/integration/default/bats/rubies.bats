@test "we have chruby with user rubies" {
  sudo -u vagrant -i 'chruby' | grep ruby-1.9.3-p392
}
