source 'https://rubygems.org'
#puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']

group :development, :test do
  gem 'puppet-blacksmith'
  gem 'puppet-lint'
  gem 'puppetlabs_spec_helper'
  gem 'rake'
  gem 'rspec'
  gem 'rspec-puppet'
  gem 'guard'
  gem 'guard-rake'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'growl',      :require => false
  gem 'libnotify',  :require => false
end

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
