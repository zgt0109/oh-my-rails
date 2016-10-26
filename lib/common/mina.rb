gem_group :development do
  gem 'mina', '~> 0.3.8'
  gem 'mina-puma', '~> 0.3.2'
end

run_bundle


# initialize
run 'bundle exec spring stop'
run 'mina init'
# mina
gsub_file 'config/deploy.rb', /(set\s*:domain).*/, "\\1, '#{ask('domain:')}'"
gsub_file 'config/deploy.rb', /(set\s*:repository).*/, "\\1, '#{ask('repository:')}'"
gsub_file 'config/deploy.rb', /(set\s*:deploy_to).*/, "\\1, '/var/www/#{app_name}'"
gsub_file 'config/deploy.rb', /(#\s*)(set\s*:user).*/, "\\2, 'deploy"
gsub_file 'config/deploy.rb', /(#\s*)(set\s*:port).*/, "\\2, '22"
gsub_file 'config/deploy.rb', /(#\s*)(set\s*:forward_agent).*/, "\\2, true"


# mina-puma
insert_into_file 'config/deploy.rb', after: 'require.*git' do
"require 'mina/puma'"
end
