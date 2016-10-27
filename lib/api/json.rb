gem 'active_model_serializers', '~> 0.10.2'

run_bundle

run "bundle exec spring stop"
application 'ActiveModel::Serializer.config.adapter = :json_api'

append_to_file 'config/initializers/mime_types.rb' do
  <<-EOS.strip_heredoc
    # http://jsonapi.org.cn/
    Mime::Type.register "application/json", :json, %w( application/vnd.api+json text/x-json application/jsonrequest  )
  EOS
end

git add: '.'
git commit: %Q< -m 'api:json' >
