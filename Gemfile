source 'https://rubygems.org'
ruby '2.1.2'

gem 'bootstrap-sass', '3.1.1.1'
gem 'coffee-rails'
gem 'rails', '4.1.1'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'
gem 'bcrypt'
gem "bootstrap_form", "~> 2.7"
gem "sidekiq", "4.2"
gem 'unicorn'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '2.99'
end

group :test do
  gem 'database_cleaner', '1.4.1'
  gem 'shoulda-matchers', '2.7.0'
  gem 'vcr', '2.9.3'
  gem "factory_bot_rails", "~> 4.0"
  gem 'faker'
  gem "capybara", "~> 2.2.1"
  gem "capybara-email"
  gem 'launchy'
end 

group :production, :staging do
  gem 'rails_12factor'
end

