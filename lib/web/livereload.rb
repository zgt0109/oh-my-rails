gem_group :development do
  gem 'guard-livereload', '~> 2.5'
  gem 'rack-livereload', '~> 0.3.16'
end

run_bundle

run "bundle exec guard init livereload"
environment nil , env: 'development' do
  %q{config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload}
end

git add: "."
git commit: %Q{ -m 'web:livereload' }
