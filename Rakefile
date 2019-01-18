# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'

task default: :spec

if Gem::Specification.find_by_name('puppet-lint')
  require 'puppet-lint/tasks/puppet-lint'
  PuppetLint.configuration.fail_on_warnings
  PuppetLint.configuration.send('relative')
  PuppetLint.configuration.send('disable_80chars')
  PuppetLint.configuration.send('disable_class_inherits_from_params_class')
  PuppetLint.configuration.send('disable_documentation')
  PuppetLint.configuration.send('disable_single_quote_string_with_variables')
  PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'vendor/**/*.pp']
  task default: %i[rspec lint]
end
