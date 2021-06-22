require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require_relative 'temporal'


ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Warden.test_mode!

After { Warden.test_reset! }

World Warden::Test::Helpers
World Temporal

Before('@time') do
  zone = ActiveSupport::TimeZone['Stockholm']
  Time.zone = zone
end

After('@time') do
  back_to_the_future
end