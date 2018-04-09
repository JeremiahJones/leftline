source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Authentication
gem 'devise'
# gem 'doorkeeper'
# Http connections, done easier
gem 'httparty'

# Use for env variables
gem 'dotenv-rails', groups: %i[development test]

group :test do
  # A fixtures replacement with a more straightforward syntax
  gem 'factory_bot_rails', '~> 4.0'
  # Provides RSpec with additional matchers
  gem 'shoulda-matchers', '~> 3.1'
  # A library for generating fake data
  gem 'faker'
  # cleans database to ensure a clean state in each test suite
  gem 'database_cleaner'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Primary testing framework
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Run react and rails server at the same time
  gem 'foreman', '~> 0.82.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
