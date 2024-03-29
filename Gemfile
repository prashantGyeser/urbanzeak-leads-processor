source 'https://rubygems.org'


ruby "2.1.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use postgresql as the database for Active Record
gem 'pg'

gem 'annotate',        group: :development

gem 'aws-sdk', '~> 1.0'

gem 'stuff-classifier', :git => 'git://github.com/alexandru/stuff-classifier.git'

# Background processor
gem 'delayed_job_active_record'

gem 'will_paginate', '~> 3.0'

gem 'smarter_csv'

gem 'sidekiq'

# Application monitoring
gem 'honeybadger'

# Web interface for sidekiq
gem 'sinatra', '>= 1.3.0', :require => nil

gem 'tweetstream'

# Env config info
gem "figaro"

gem 'twitter'

gem 'iron_mq'

# datasift
gem 'datasift'

gem 'geocoder'

# Gem to import records without the delay in Activerecord
gem 'activerecord-import'

gem 'httparty'


group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
end

gem 'rails_12factor',        group: :production
#gem 'webmock',        group: :test
