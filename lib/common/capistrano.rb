gem_group :development do
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano3-puma', '~> 1.2'
end

run_bundle

# initialize
run "bundle exec spring stop"
run "cap install"

#　capistrano
uncomment_lines 'Capfile', /require.*bundle/
uncomment_lines 'Capfile', /require.*assets/ unless options[:api]
uncomment_lines 'Capfile', /require.*migrations/

uncomment_lines 'config/deploy.rb', /ask\s+:branch/
uncomment_lines 'config/deploy.rb', /append\s:linked_dirs/
gsub_file 'config/deploy.rb', /(set\s+:repo_url,).*/, "\\1, '#{ask('repository:')}'"
gsub_file 'config/deploy.rb', /(set\s+:application,).*/, "\\1 '#{app_name}'"
gsub_file 'config/deploy.rb', /(#\s+)(set\s+:deploy_to,).*/, '\2 "/var/www/#{fetch(:application)}"'


# capistrano3-puma
insert_into_file 'Capfile', :after => /require.*passenger.*\s/ do
  <<-EOS.strip_heredoc
    require 'capistrano/puma'
    require 'capistrano/puma/nginx'
  EOS
end

domain = ask('domain:')

insert_into_file 'config/deploy.rb', :after=> /set\s+:keep_releases.*\s/  do
  <<-EOS.strip_heredoc

    # https://github.com/seuros/capistrano-puma
    set :nginx_sites_available_path, "/etc/nginx/sites-available"
    set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
    set :nginx_server_name, "#{domain}"

  EOS
end

# stage: production
prepend_to_file 'config/deploy/production.rb' do
"server '#{domain}', user: 'deploy', roles: %w{app db web}"
end

git add: "."
git commit: %Q{ -m 'common:capistrano' }
