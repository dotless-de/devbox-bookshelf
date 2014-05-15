source 'https://rubygems.org'

gem 'librarian-chef'

gem 'net-ssh', '>= 2.7.0'
gem 'test-kitchen', '~> 1.0', :group => [:test, :integration]
gem 'kitchen-vagrant', '~> 0.11', :group => :integration

group :test do
  gem 'rake'
  gem 'foodcritic', :platforms => [:ruby_19, :ruby_20, :ruby_21]
end
