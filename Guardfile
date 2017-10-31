# More info at https://github.com/guard/guard#readme

directories %w(app lib test)

guard :minitest, bundler: true do
  watch(%r{^app/(.+)\.rb$})  { "test" }
  watch(%r{^lib/(.+)\.rb$})  { "test" }
  watch(%r{^test/(.+)\.rb$}) { "test" }
end

guard 'rails', daemon: true, server: 'puma', root: './test/dummy', host: 'localhost' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

