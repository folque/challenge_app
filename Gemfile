source 'https://rubygems.org'
ruby '1.9.3'

# core
gem 'rails', '4.1.1'
gem 'pg', '0.15.1'
gem 'devise'

# frontend
gem 'slim-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# Windows compatibility
gem 'tzinfo-data'

# doc
gem 'sdoc', '~> 0.4.0',          group: :doc

# Image processing
gem 'paperclip', '~> 3.5.3'
gem 'cocaine', '~> 0.5.4'
gem 'aws-sdk'

# development
group :development do
  gem 'spring'
end

# testing
group :test do
  gem "database_cleaner",   "~> 1.2.0"
  gem "capybara",           github: "jnicklas/capybara" # master until rspec3 fixes are released #~> 2.2.0"
  gem "poltergeist",        "~> 1.5.0"
  gem "factory_girl_rails", "~> 4.2.0"
  gem "cucumber-rails",     "~> 1.4.1", require: false
  gem "factory_girl"
  gem "rspec-rails"
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

