source "https://rubygems.org"

# Declare your gem's dependencies in wobauth.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

# specifying git is not possible in *gemrc

group :development, :test do
  # otherwise bundle exec rake db:migrate RAILS_ENV=test won't work
  gem 'simple_form'
  gem 'devise'
  gem 'cancancan'
  gem 'wobaduser'
end

gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'responders', git: 'https://github.com/heartcombo/responders', branch: 'main'
