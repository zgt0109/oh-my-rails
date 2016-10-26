# database.yml
if options[:database] == 'postgresql'
  insert_into_file 'config/database.yml', :after => 'encoding: unicode' do
    <<-EOS.strip_heredoc.indent(2)

    host: <%= ENV['#{app_name.upcase}_DATABASE_HOST'] %>
    EOS
  end
end

append_to_file '.env.example' do
  <<-EOS.strip_heredoc
    export #{app_name.upcase}_DATABASE_HOST=127.0.0.1
    export #{app_name.upcase}_DATABASE_PASSWORD=
  EOS
end


gem 'paranoia', '~> 2.2'

run_bundle


# paranoia
copy_file 'paranoia_examples.rb',
          'spec/support/shared_examples/paranoia_examples.rb'

git add: "."
git commit: %Q{ -m 'common:db' }
