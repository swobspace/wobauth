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
  gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers.git', 
                     branch: "develop"
  gem 'wobaduser', git: 'https://github.com/swobspace/wobaduser.git', branch: 'master'
  gem 'immutable-struct'
  gem 'cancancan'
  gem 'simple_form'
  gem 'record_tag_helper', '~> 1.0'
  gem "guard"
  gem "guard-minitest"
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-livereload', require: false
  gem 'guard-bundler'
  gem 'puma'
  gem 'font-awesome-sass'
  gem 'capybara'
  gem 'poltergeist'
end

