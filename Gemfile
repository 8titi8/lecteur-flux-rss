source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 6.0.0'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem "react-rails", "~> 2.6"
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'whenever', '~> 1.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # gem 'rspec-rails', '~> 3.9'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'database_cleaner', '~> 1.7'
  gem 'faker', '~> 2.7'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'rails-controller-testing'
  gem 'capybara', '~> 2.7', '>= 2.7.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

