gem_group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  # gem 'factory_girl_rails', '~> 4.7'
  # gem 'timecop', '~> 0.8.1'
end

# gem_group :development do
#   gem 'guard-rspec', '~> 4.7'
#   gem 'spring-commands-rspec', '~> 1.0'
#   gem 'fuubar', '~> 2.2'
# end
#
# gem_group :test do
#   gem 'database_cleaner', '~> 1.5'
#   gem 'shoulda-matchers', '~> 3.1'
#   gem 'faker', '~> 1.6'
# end

run_bundle
#
# # rspec
run "bundle exec spring stop"

generate 'rspec:install'
# uncomment_lines 'spec/rails_helper.rb', /support.*require/
#
# inject_into_class 'config/application.rb', 'Application' do
#   <<-EOS.strip_heredoc.indent(4)
#     # Setting for Rspec
#     config.generators do |g|
#       g.test_framework :rspec,
#         fixtures: true,
#         view_specs: false,
#         helper_spece: false,
#         routing_specs: false,
#         controller_specs: false,
#         request_specs: false
#       g.fixture_replacement :factory_girl, dir: 'spec/factories'
#     end
#   EOS
# end
#
# # Fuubar
# append_to_file '.rspec', '--format Fuubar'
#
# # shoulda-matchers
# copy_file 'shoulda_matchers.rb', 'spec/support/shoulda_matchers.rb'
#
# # factory_girl
# copy_file 'factory_girl.rb', 'spec/support/factory_girl.rb'
#
# # rspec - guard
# run "bundle exec guard init rspec"
# run "bundle exec spring binstub rspec"
# run "bundle exec spring stop"
# gsub_file 'Guardfile', /cmd: "bundle exec rspec"/, 'cmd: "spring rspec"'
#
# git add: "."
# git commit: %Q{ -m 'common:rspec' }
