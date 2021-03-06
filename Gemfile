source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.4'
gem 'mysql2', '0.3.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'font-awesome-rails'
gem 'rails-i18n'
gem 'carrierwave'
gem 'mini_magick'
gem 'uglifier'
gem 'omniauth-facebook'
gem "omniauth"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'bullet'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'erb2haml'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails', "~> 4.4.1"
  gem 'faker'
  gem 'rails-controller-testing'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
