source 'https://rubygems.org'

gem 'rails', '4.0.1'

# Database gems
gem 'sqlite3'
gem 'pg'

# JS / CSS
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0' # Compress JS
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-timepicker-addon-rails'

gem 'turbolinks' # Faster links
gem 'devise' # Authentication

gem 'devise-i18n-views' # Make Devise speak tongues
gem 'rails-i18n', '~> 4.0.0' # import standard translations

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara', '1.1.4'
  gem 'guard-rspec', require: false
  gem 'factory_girl'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development do
  gem 'rails-erd'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'i18n-tasks', '~> 0.2.10'  # Gem for testing i18n!
end

# run bundle exec rake doc:rails to generate api doc at doc/api
group :doc do
  gem 'sdoc', require: false
end
