require 'rubygems'
require 'bundler'
Bundler.setup

require 'rake'
require 'foodcritic'

task :default => [:foodcritic]

desc "Runs foodcritic linter"
task :foodcritic do
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox = File.join(File.dirname(__FILE__), %w{tmp foodcritic})
    sandbox_paths = prepare_foodcritic_sandbox(sandbox)

    print "Running foodcritic ... "
    linter = FoodCritic::Linter.new
    result = linter.check cookbook_paths: sandbox_paths[:cookbooks], role_pahts: sandbox_paths[:roles], fail_tags: ['any']

    if result.failed? or result.warnings.size > 0
      puts "FAILED"
      puts result
      fail
    else
      puts "OK"
      puts result
    end
  else
    puts "WARNING: Skipped running foodcritic. Ruby 1.9.2 or higher required"
  end
end



private

def prepare_foodcritic_sandbox(sandbox)
  files = %w{*.md *.rb attributes definitions files libraries providers
recipes resources templates}

  rm_rf sandbox

  cookbooks_trgt = File.join(sandbox, 'cookbooks')
  mkdir_p sandbox
  Dir.glob("vendor/cookbooks/*").each do |dir|
    trgt = File.join(cookbooks_trgt, File.basename(dir))
    mkdir_p trgt
    cp_r Dir.glob("#{dir}/{#{files.join(',')}}"), trgt
  end

  roles_trgt = File.join(sandbox, 'roles')
  mkdir_p roles_trgt
  cp_r Dir.glob('roles/*.rb'), roles_trgt

  puts "\n\n"

  {roles: roles_trgt, cookbooks: cookbooks_trgt}
end

