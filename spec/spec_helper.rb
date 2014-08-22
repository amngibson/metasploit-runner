RSpec.configure do |config|

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

end