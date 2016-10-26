gem 'semantic-ui-sass', '~> 2.2'

run_bundle

copy_file 'app/assets/stylesheets/application.css',
  'app/assets/stylesheets/application.scss' do |content|
    content << '@import "semantic-ui";'
end


insert_into_file 'app/assets/javascripts/application.js', :after => "jquery\n" do
  "//= require semantic-ui\n"
end

remove_file 'app/assets/stylesheets/application.css'

git add: "."
git commit: %Q{ -m 'web:semantic' }
