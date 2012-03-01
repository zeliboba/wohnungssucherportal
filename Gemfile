# -*- mode: ruby; -*-

source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mysql2", "~> 0.3.0"
gem "hpricot", "0.8.4"
gem "htmlentities", "4.3.0"
gem "rdoc"
gem "rake", "0.8.7"
gem "gmaps4rails"
gem "rails_autolink", "1.0.4"
gem "draper" # view models / decorators
gem "rspec"
gem "rspec-rails"
gem "haml-rails"
gem "sass"
gem "devise"
gem "mechanize"
gem "kaminari"

group :test do
  gem "fuubar" # better rspec output formatter and immediate test result output
  gem "capybara"  
  gem "autotest"
  gem "launchy" # required for save_and_open_page in request specs
  gem "database_cleaner" # to establish a known db state before running new tests
  gem "factory_girl_rails" # to generate model data for tests
  gem "rcov"
  gem "spork", "> 0.9.0.rc"
end

group :development do
  gem 'rb-fsevent', :require => false
  gem 'guard-pow'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
end

# Use unicorn as the web server
# gem 'unicorn'

group :deployment do
  gem 'capistrano'
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

