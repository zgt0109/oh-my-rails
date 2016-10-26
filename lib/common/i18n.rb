gem 'rails-i18n', '~> 5.0'

run_bundle

copy_file 'locale.rb', 'config/initializers/locale.rb'
remove_file 'config/locales/en.yml'
directory 'locales', 'config/locales'

git add: "."
git commit: %Q{ -m 'common:i18n' }
