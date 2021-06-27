source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'guard', '~> 2.17'
  gem 'guard-bundler', '~> 3.0'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rspec-timecop'
  gem 'shoulda-matchers'
  gem 'terminal-notifier', '~> 2.0'
  gem 'terminal-notifier-guard', '~> 1.7'
  gem 'guard-cucumber', '~> 3.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'administrate', github: 'excid3/administrate', branch: 'jumpstart'
gem 'bootstrap', '~> 4.5'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'devise-bootstrapped', github: 'excid3/devise-bootstrapped', branch: 'bootstrap4'
gem 'devise_masquerade', '~> 1.2'
gem 'font-awesome-sass', '~> 5.13'
gem 'friendly_id', '~> 5.3'
gem 'image_processing'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'name_of_person', '~> 1.1'
gem 'noticed', '~> 1.2'
gem 'omniauth-facebook', '~> 6.0'
gem 'omniauth-github', '~> 1.4'
gem 'omniauth-twitter', '~> 1.4'
gem 'pundit', '~> 2.1'
gem 'redis', '~> 4.2', '>= 4.2.2'
gem 'sidekiq', '~> 6.0', '>= 6.0.3'
gem 'sitemap_generator', '~> 6.1', '>= 6.1.2'
gem 'whenever', require: false

## app specific
gem 'simple_calendar', '~> 2.4', '>= 2.4.1'
gem 'stripe', '~> 5.28'
# active_storage for s3 and heroku
gem 'aws-sdk-s3', '~> 1.84', '>= 1.84.1'
# appointment management
gem 'acts_as_bookable', git: 'https://github.com/captproton/acts_as_bookable'
# working in vscode
gem 'rubocop', group: :development
gem 'solargraph', '~> 0.40.4', group: :development
