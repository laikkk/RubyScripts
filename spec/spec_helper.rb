# in spec/calculator_spec.rb
# - RSpec adds ./lib to the $LOAD_PATH
require "wyszukiwanie_wzorca.rb"
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
