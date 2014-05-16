include_recipe "git"

template "/home/vagrant/.gitconfig" do
  action :create_if_missing
  source "gitconfig.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end

template "/home/vagrant/.gitignore_global" do
  action :create_if_missing
  source "gitconfig.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
