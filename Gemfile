source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails'
gem 'jquery-rails'
gem 'rake'
gem 'haml-rails'
gem 'therubyracer'
gem 'devise'
gem 'devise_invitable'
gem 'activeadmin', :github => 'gregbell/active_admin'
gem 'paperclip'
gem 'rmagick'
gem 'coffee-script-source'
gem 'pg'

gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'
gem 'sass-rails'
gem 'sunspot_rails'

group :development do
  gem 'sunspot_solr'
end

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
group :test do
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'simplecov', :require => false
end

