gem 'rack-cors', '~> 0.4.0'

run_bundle

# Rack CORS Middleware
application do
  <<-EOS.strip_heredoc.indent(4)
    # Rack CORS Middleware
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  EOS
end

git add: '.'
git commit: %Q< -m 'api:cors' >
