source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "doorkeeper"
gem "sorcery"

group :development, :test do
  gem "byebug"
  gem "capybara", "~> 2.13"
  gem "database_rewinder"
  gem "factory_girl_rails"
  gem "onkcop", require: false
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller", "~> 0.7.2"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
