gem 'slim-rails', '~> 3.1'

run_bundle

# App
application 'config.generators.assets = false'
application 'config.generators.helper = false'

# Capistrano
uncomment_lines 'Capfile', /require.*assets/

# Slim
application 'Slim::Engine.options[:pretty] = true'




git add: "."
git commit: %Q{ -m 'web:app' }
