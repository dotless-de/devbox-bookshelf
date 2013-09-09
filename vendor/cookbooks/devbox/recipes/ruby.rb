include_recipe "ruby_install"

node['devbox']['rubies'].each do |rubie|
  ruby_install_ruby rubie do
    user 'vagrant'
    group 'vagrant'
    prefix_path "/home/vagrant/.rubies/#{rubie.gsub(' ', '-')}"
    environment "HOME" => "/home/vagrant", "SRC_DIR" => "/home/vagrant/src"
  end
end

file '/etc/profile.d/chruby.sh' do
  content <<-BASH.gsub /^\s+/, ""
    [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
  BASH
end
