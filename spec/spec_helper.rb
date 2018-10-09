# frozen_string_literal: true

require 'prime'
require 'simplecov'
SimpleCov.start

Dir[File.join('./lib', '**/*.rb')].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.disable_monkey_patching!

  config.warnings = true

  config.files_to_run.one? && config.default_formatter = 'doc'

  config.order = :random

  Kernel.srand config.seed
end
