include_recipe "ruby_install"

node['devbox']['rubies'].each do |rubie, options|
  opts = {
    "prefix_path" => "/home/vagrant/.rubies/#{rubie.gsub(' ', '-')}"
  }.merge(options || {})

  ruby_install_ruby rubie do
    user 'vagrant'
    group 'vagrant'

    prefix_path opts["prefix_path"]
    source_dir  opts["source_dir"]
    patch       opts["patch"]
    mirror      opts["mirror"]
    url         opts["url"]
    md5         opts["md5"]

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
