# App

application 'config.generators.assets = false'
application 'config.generators.helper = false'
application 'Slim::Engine.options[:pretty] = true'

# capistrano-rails


gem 'slim-rails', '~> 3.1'

run_bundle

git add: "."
git commit: %Q{ -m 'web:app' }
