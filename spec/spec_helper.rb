require 'bundler/setup'
Bundler.setup

require 'wobauth'
require 'dotenv'

Dotenv.load( File.expand_path(__FILE__ + '/../.localenv'),
              File.expand_path(__FILE__ + '/../.env'))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.around(:each) do |example|
    Timeout::timeout(Wobaduser.timeout + 1) {
      example.run
    }
  end

end
