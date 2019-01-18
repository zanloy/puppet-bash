# frozen_string_literal: true

source 'https://rubygems.org'

group :development, :test do
  gem 'guard'
  gem 'guard-rake'
  gem 'guard-rspec'
  gem 'libnotify', require: false
  gem 'puppet-blacksmith'
  gem 'puppet-lint'
  gem 'puppetlabs_spec_helper'
  gem 'rake'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'rspec'
  gem 'rspec-puppet'
  gem 'rubocop'
end

puppetversion = ENV['PUPPET_VERSION'] || '>= 3.0'
gem 'puppet', puppetversion, require: false

# if (puppetversion = ENV['PUPPET_VERSION'])
#   gem 'puppet', puppetversion, require: false
# else
#   gem 'puppet', require: false
# end
