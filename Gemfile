source 'https://rubygems.org'

gem 'librarian-chef'

gem 'net-ssh', '>= 2.7.0'
gem 'test-kitchen', '~> 1.0.0.beta3', :group => [:test, :integration], :github => "dotless-de/test-kitchen", :branch => "allow-ssh-forward_agent"
gem 'kitchen-vagrant', :group => :integration, :github => 'dotless-de/kitchen-vagrant', :branch => 'master'

# gem 'net-ssh', :path => "gems/net-ssh"
# gem 'test-kitchen', '~> 1.0.0.beta3', :group => [:test, :integration], :path => "gems/test-kitchen"
# gem 'kitchen-vagrant', :group => :integration, :path => "gems/kitchen-vagrant"


group :test do
  gem 'rake'
  gem 'foodcritic', :github => 'acrmp/foodcritic', :platforms => [:ruby_19, :ruby_20]
end
