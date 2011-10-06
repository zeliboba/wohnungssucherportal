source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mysql2", "~> 0.3.0"
gem "hpricot", "0.8.4"
gem "htmlentities", "4.3.0"
gem "rdoc"
gem "rake", "0.8.7"
gem "gmaps4rails"
gem "rails_autolink", "1.0.2"
gem "draper" # view models / decorators

group :test do
  gem "rspec"
  gem "fuubar" # better rspec output formatter and immediate test result output
  gem "capybara"  
  gem "autotest"
  gem "launchy" # required for save_and_open_page in request specs
  gem "database_cleaner" # to establish a known db state before running new tests
  gem "factory_girl_rails", "~> 1.1.rc1" # to generate model data for tests
end

group :test, :development do
  gem "rspec-rails"
end

group :development do
  gem 'rb-fsevent', :require => false
  gem 'guard-pow'
  gem 'guard-bundler'
  gem 'guard-livereload'
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

