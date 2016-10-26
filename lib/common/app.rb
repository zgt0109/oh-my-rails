gem_group :development do
  gem 'foreman', '~> 0.82.0'
  gem 'annotate', '~> 2.7'
  gem 'seedbank', '~> 0.4.0'
  gem 'pry-rails', '~> 0.3.4'
  gem 'pry-remote', '~> 0.1.8'
  gem 'dotenv-rails', '~> 2.1'
end

run_bundle

# foreman
copy_file 'Procfile'

# annotate
run "bundle exec spring stop"
generate "annotate:install"

# seedbank
create_file 'db/seeds/development/.keep'

# dotenv
copy_file 'environment', '.env'
append_to_file '.gitignore' do
  <<-EOS.strip_heredoc

    \# load environment variables
    .env*
    !.env.example
  EOS
end

git add: "."
git commit: %Q{ -m 'common:app' }
