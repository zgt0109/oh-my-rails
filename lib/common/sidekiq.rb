if yes?("Do You Support Sidekiq")
  gem 'sidekiq', '~> 4.2'
  gem 'sinatra', '~> 2.0.0.beta2'

  run_bundle

  # sidekiq
  # https://junnan.org/2015/08/sidekiq.html
  prepend_to_file 'config/routes.rb', "require 'sidekiq/web'\n"
  route("mount Sidekiq::Web => '/sidekiq'")
  application "config.active_job.queue_adapter = :sidekiq"
  copy_file 'sidekiq.yml', 'config/sidekiq.yml'

  append_to_file 'Procfile', "worker: bundle exec sidekiq -C config/sidekiq.yml"
end
